#!/bin/bash


# perform initial repo update
echo "[system] Performing initial distro repo update"
sudo apt-get -y update

# basic packages
echo "[system] Installing system packages"
sudo apt-get -qq install -y build-essential make curl wget openssl gdb coreutils pkg-config

# some dev libraries
echo "[system] Installing dev libraries"
sudo apt-get -qq install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-de

# useful tools
echo "[system] Installing utils"
sudo apt-get -qq install -y zip unzip upx unrar-free jq dnsutils tcpdump httpie tree

# security and privacy
echo "[system] Installing security and privacy tools"
sudo apt-get -qq install -y secure-delete
