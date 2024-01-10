# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump kubectl helm aws istioctl nvm)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/.zshrc_aliases
source ~/.dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.dotfiles/themes/powerlevel10k/powerlevel10k.zsh-theme

alias ll="ls -al"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
