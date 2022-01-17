
# TODO: remove hardcoding dirnames
export PATH="$HOME/bits-bots-dots/scripts:$PATH"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

zstyle ':omz:update' frequency 13

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

plugins=(
	archlinux
	git 
	vi-mode 
	web-search
)

source $ZSH/oh-my-zsh.sh


