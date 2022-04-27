# The below code copies all the files to respective dir
\cp .bashrc ~/
\cp .gitconfig ~/
\cp .inputrc ~/
\cp .tmux.conf ~/
\cp .ideavimrc ~/
\cp conf ~/.ssh/
# The below code creates a hard link for the dotfiles
ln .bashrc ~/.bashrc
ln .gitconfig ~/.gitconfig
ln .inputrc ~/.inputrc
ln .tmux.conf ~/.tmux.conf
ln .ideavimrc ~/.ideavimrc
ln config ~/.ssh/config

