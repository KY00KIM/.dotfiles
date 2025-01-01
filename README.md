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
  sudo docker run -e TERM -e COLORTERM -e LC_ALL=C.UTF-8 -it --rm alpine sh -uec '
  apk add git zsh nano vim python3 &&
  cd ~ &&
  git clone https://github.com/KY00KIM/.dotfiles --recursive --shallow-submodules &&
  ./.dotfiles/install.sh &&
  exec zsh'
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
