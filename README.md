Backup of my dotfiles. 

first time setup - create bare repository
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles

alias dotfiles, put in .zshrc
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

add remote and don't show untracked files 
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:anandpiyer/.dotfiles.git

use alias as if you would use git
cd $HOME
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push

restoring dotfiles to new machine
clone repo
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git ~

source -> https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles/
