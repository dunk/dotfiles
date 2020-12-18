#!/usr/bin/env bash
read -p "This will nuke all the dotfiles and replace them with symlinks. Ok? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    FILES=(.ackrc .aliases .bash_complete .bash_profile .bash_prompt .bashrc .curlrc .docker_aliases .docker_bash .exports .functions .fzf.bash .gitconfig .gitignore_global .hushlogin .inputrc .minimalvimrc .screenrc .todo .vimrc .vim)
    cd "$(dirname "${BASH_SOURCE}")" # TODO: do this just once??
    for file in ${FILES[@]}; do rm -rf ../$file; done
    for file in ${FILES[@]}; do ln -s $HOME/dotfiles/$file $HOME/$file; done
fi
