echo "[zsh] Installing 'zsh'"
sudo apt-get install zsh zsh-syntax-highlighting
echo "[zsh] Installing 'oh-my-zsh'"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
echo "[zsh] Installing 'spaceship' theme for 'oh-my-zsh'"
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom" # Faking env var cus we're not on zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
echo "[zsh] Copying .zshrc to $HOME/.zshrc ..."
cp $REPO_HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
