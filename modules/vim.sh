echo "[vim] Installing vim"
sudo apt-get install vim
echo "[vim] Copying .vimrc"
cp $REPO_HOME/dotfiles/vim/.vimrc $HOME/.vimrc
