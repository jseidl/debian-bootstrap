echo "[python] Installing core packages"
sudo apt-get -qq install -y python3 python3-setuptools python3-pip bpython
pip3 install --upgrade setuptools
pip3 install --upgrade pip

echo "[python] Installing pyenv"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# Check to see if zsh was installed
if [ $(dpkg-query -W -f='${Status}' zsh 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
else
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
fi
