echo "[tmux] Installing tmux"
sudo apt-get install tmux
echo "[tmux] Copying .tmux.conf"
cp $REPO_HOME/dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
