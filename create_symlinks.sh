#! /bin/bash

BASEDIR=$HOME/OneDrive/lib/dotfiles
ZSH_BASEDIR=$HOME/OneDrive/lib/zsh

for i in .bash_profile .bashrc .emacs.d .gitconfig .gitignore .tmux.conf;
do
    if [ ! -e $BASEDIR/$i ]; then
        ln -s $BASEDIR/$i $HOME
    fi
done

for i in .zshrc .zsh-history;
do
    if [ ! -e $ZSH_BASEDIR/$i ]; then
        ln -s $ZSH_BASEDIR/$i $HOME
    fi
done
