#!/bin/zsh

ln -s ~/.dotfiles/themes/powerlevel10k ~/.dotfiles/.oh-my-zsh/custom/themes/powerlevel10k 
ln -s -f ~/.dotfiles/.zshrc ~/.zshrc
ln -s -f ~/.dotfiles/.zlogin ~/.zlogin
ln -s -f ~/.dotfiles/.vimrc ~/.vimrc
ln -s -f ~/.dotfiles/.tmux/.tmux.conf ~/.tmux.conf
ln -s -f ~/.dotfiles/.tmux.conf.local ~/.tmux.conf.local
# ln -s -f ~/.dotfiles/themes/.p10k.zsh ~/.p10k.zsh

cp -n ~/.dotfiles/.zshenv ~/.zshenv
cp -n ~/.dotfiles/.gitconfig ~/.gitconfig

# Autojump Plugin
cd ~/.dotfiles/plugins/autojump &&\ 
./install.py &&\
cd -

echo 'Success.\n'
echo 'Customize the files below.'
echo '\t~/.zshenv'
echo '\t~/.gitconfig'
