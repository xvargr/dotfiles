return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.o.winborder = "rounded"

      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,

    opts = {
      servers = {
        lua_ls = {},
        html = { filetypes = { "html", "templ", "blade" } },
        cssls = {},
        ts_ls = {},
        typos_lsp = {},
        intelephense = {
          settings = {
            intelephense = {
              telemetry = { enabled = false },
              diagnostics = {
                strictTypes = true,
                suspectCode = true,
                undefinedVariables = "on",
                argumentCount = "on",
              },
              completion = { withMethodBody = true },
            },
          },
        },
        phpactor = {
          cmd = { "phpactor", "language-server" },
          init_options = {
            -- Keeps Phpactor background indexing calm while serving features
            ["language_server.diagnostics_on_update"] = false,
            ["language_server.diagnostics_on_open"] = false,
            ["language_server.diagnostics_on_save"] = false,
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
          },
        },
        ruff = {},
      },
      setup = {
        intelephense = function(_, server_opts)
          server_opts.on_attach = function(client, bufnr)
            -- Turn off locked premium features & definition provider
            -- client.server_capabilities.definitionProvider = false
            -- client.server_capabilities.renameProvider = false
            -- client.server_capabilities.codeActionProvider = false
            -- client.server_capabilities.implementationProvider = false
          end
        end,
        phpactor = function(_, server_opts)
          if not vim.g.phpactor_enabled then
            return true
          end
          server_opts.on_attach = function(client, bufnr)
            -- Hand off diagnostics, references, and symbols to Intelephense
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.workspaceSymbolProvider = false
            client.server_capabilities.documentSymbolProvider = false

            -- Pull the free refactoring/definition powers from Phpactor
            client.server_capabilities.definitionProvider = true
            client.server_capabilities.implementationProvider = true
            client.server_capabilities.renameProvider = true
            client.server_capabilities.codeActionProvider = true
          end
        end,
      },
    },
  },
}
