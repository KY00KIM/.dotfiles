#!/bin/zsh

ln -s ~/.dotfiles/themes/powerlevel10k ~/.dotfiles/.oh-my-zsh/custom/themes/powerlevel10k 
ln -s -f ~/.dotfiles/.zshrc ~/.zshrc
ln -s -f ~/.dotfiles/.zlogin ~/.zlogin
ln -s -f ~/.dotfiles/.vimrc ~/.vimrc
ln -s -f ~/.dotfiles/.tmux.conf ~/.tmux.conf
# ln -s -f ~/.dotfiles/.tmux/.tmux.conf ~/.tmux.conf
# ln -s -f ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
ln -s -f ~/.dotfiles/themes/.p10k.zsh ~/.p10k.zsh

cp -n ~/.dotfiles/.zshenv ~/.zshenv
cp -n ~/.dotfiles/.gitconfig ~/.gitconfig

# Autojump Plugin
# cd ~/.dotfiles/plugins/autojump &&\ 
# ./install.py &&\
# cd -

# Nvim (linux-64)
~/.dotfiles/nvim_install.sh &&\
mkdir -p ~/.config &&\
ln -s ~/.dotfiles/nvim ~/.config/nvim

# xclip : clipboard-terminal
# ~/.dotfiles/xclip.sh

echo 'Success.\n'
echo 'Customize the files below.'
echo '\t~/.zshenv'
echo '\t~/.gitconfig'
