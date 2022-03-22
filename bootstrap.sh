#!/bin/bash

set -ev

SRC_DIRECTORY="$HOME/src/github.com/stanaka"
ANSIBLE_DIRECTORY="$SRC_DIRECTORY/ansible-playbook-osx"
ANSIBLE_CONFIGURATION_DIRECTORY="$HOME/.ansible.d"
BREW_BASEDIR="/opt/homebrew"

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
    echo "Info   | Install   | xcode"
    xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x $BREW_BASEDIR/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Modify the PATH
export PATH=$BREW_BASEDIR/bin:$PATH

# Download and install Ansible
if [[ ! -x $BREW_BASEDIR/bin/ansible ]]; then
    brew install ansible
fi

# Make the code directory
# Download and install Ansible
if [[ ! -d $SRC_DIRECTORY ]]; then
    mkdir -p $SRC_DIRECTORY
fi

# # Provision the box
# ansible-playbook --ask-sudo-pass -i $ANSIBLE_CONFIGURATION_DIRECTORY/inventories/osx $ANSIBLE_CONFIGURATION_DIRECTORY/site.yml --connection=local
ansible-playbook -i inventries --connection=local ./site.yml
# # Link the casks.
# ~/.bin/link-casks
