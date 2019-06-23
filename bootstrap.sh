#!/bin/bash
##
# Seidlmeister Debian-based distros bootstrap scripts
# based on ubuntu-bootstrap (https://github.com/deadbits/ubuntu-bootstrap)
# https://github.com/jseidl/debian-bootstrap
# 
## 

MODULES_DIR="$(pwd)/modules"
CORE_MODULES=(system vim tmux github zsh python)
REPO_HOME=$(mktemp -d --suffix='debian-bootstrap')

function is_core_module () {
  local e match="$1"
  shift
  for e; do [[ "${e}.sh" == "$match" ]] && return 0; done
  return 1
}

function ask_yes_no () {
  local prompt_msg="$1"
  while true; do
    read -p "${prompt_msg} " yn
    case $yn in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * ) echo "Please answer yes or no.";;
    esac
  done
}

function initialize () {
	# Require sudo
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	echo "Debian Boostrap / https://github.com/jseidl/debian-bootstrap"
	echo "***"
	echo " "
	echo "[init] Installing git and cloning repository"
	sudo apt-get -qq install -y git
	git clone https://www.github.com/jseidl/debian-bootstrap $REPO_HOME
	cd $REPO_HOME
	echo "[init] Updating git submodules"
	git submodule update
	clear
}

function run_modules () {

	for f in $(ls "$MODULES_DIR"); do
		# Check if module is a CORE_MODULE.
		is_core_module "$f" "${CORE_MODULES[@]}"
		# If not a core module, prompt
		if [ $? -ne 0 ]; then
			ask_yes_no "Install module '${f%.*}'?"
			if [ $? -ne 0 ]; then
				# No replied, continue loop
				continue
			fi
		fi
		echo "[init] Installing module '${f}'"
		source "$MODULES_DIR/$f";
	done
}

#initialize
run_modules
