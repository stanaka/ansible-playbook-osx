#! /bin/bash

BASEDIR=$HOME/OneDrive/lib/dotfiles
ZSH_BASEDIR=$HOME/OneDrive/lib/zsh

for i in .alacritty.toml .bash_profile .bashrc .bc .emacs.d .gitconfig .gitignore .tmux.conf;
do
    if [ ! -e $HOME/$i ]; then
        ln -s $BASEDIR/$i $HOME
    fi
done

for i in .zshrc
do
    if [ ! -e $HOME/$i ]; then
        ln -s $ZSH_BASEDIR/$i $HOME
    fi
done
