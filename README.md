# .dotfiles

## Clone

Clone the repository at `~`. (Home Directory)

```bash
git clone https://github.com/KY00KIM/.dotfiles --recursive --shallow-submodules
```

## Install

Install zsh if you don't have it.

```bash
sudo apt-get install zsh
chsh -s $(which zsh)
```

```bash
./.dotfiles/install.sh
```

## Run via Docker

```bash
  sudo docker run -e TERM -e COLORTERM -e LC_ALL=C.UTF-8 -it --rm ubuntu:22.04 bash -c "
    # install dependencies
    apt update && apt install -y sudo git zsh curl libevent-dev ncurses-dev build-essential bison pkg-config wget python3 &&

    # dummy user
    useradd -m -s /bin/bash dummyuser &&
    echo 'dummyuser:123' | chpasswd &&
    usermod -aG sudo dummyuser &&

    # install tmux
    git clone https://github.com/tmux-plugins/tpm /home/dummyuser/.tmux/plugins/tpm &&
    wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz &&
    tar -zxf tmux-3.5a.tar.gz &&
    cd tmux-3.5a &&
    ./configure &&
    make &&
    make install &&
    cd / && rm -rf tmux-3.5a* &&

    # install neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz &&
    tar -C /opt -xzf nvim-linux64.tar.gz &&
    ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim && 
    chown -R dummyuser:dummyuser /home/dummyuser/.tmux &&
    chsh -s /usr/bin/zsh dummyuser &&

    # switch to dummyuser
    su - dummyuser -c '
        git clone https://github.com/KY00KIM/.dotfiles /home/dummyuser/.dotfiles --recursive --shallow-submodules &&
        zsh
    '
"
```

### Plugins

```
cd ./.dotfiles/plugins/autojump && ./install.py && cd -
```

## Appendix

### Add User

```bash
sudo adduser [name]
sudo usermod -aG sudo [name]

# optional for ssh
su - [name]
vi ~/.ssh/authorized_keys
```
