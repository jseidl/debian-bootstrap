echo "[github Enter your Github username: "
read github_user
echo "[github] Enter your Github email address: "
read github_email
    
if [[ $github_user && $github_email ]]; then
    git config --global user.name $github_user
    git config --global user.email $github_email
    git config --global github.user $github_user

    pushd $HOME/.ssh
    ssh-keygen -t rsa -b 4096 -C $github_email
    echo "[github] Add the SSH public key located at $HOME/.ssh/$github_email to your account."
    popd
fi
