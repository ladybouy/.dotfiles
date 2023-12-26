#!/bin/sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$PATH:$HOME/.scripts/bin:$HOME/.scripts/shell:$HOME/.scripts/python:$HOME/.local/bin

# General settings
unsetopt nomatch

# Themes
source $HOME/.themes/statusbar_colors.sh

#Key Bindings
zle -N fzf_open_file
zle -N fzf_cd
bindkey '^[f' fzf_open_file

# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Functions
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-alias"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "hlissner/zsh-autopair"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lady/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lady/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lady/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:/home/lady/anaconda3/bin"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

RANGER_LOAD_DEFAULT_RC=FALSE 

# Less display colors 
export LESS_TERMCAP_mb=$'\e[1;31m'          # begin bold
export LESS_TERMCAP_md=$'\e[1;94m'          # begin blink
export LESS_TERMCAP_so=$'\e[43;30m'         # begin reverse text
export LESS_TERMCAP_us=$'\e[4;35m'          # begin underline
export LESS_TERMCAP_me=$'\e[0m'             # reset bold/blink 
export LESS_TERMCAP_se=$'\e[0m'             # reset reverse text
export LESS_TERMCAP_ue=$'\e[0m'             # reset underline

# fzf
export FZF_DEFAULT_OPTS="--reverse --extended --color=bg:$DARK_BACKGROUND,bg+:$LIGHt_BACKGROUND,spinner:$RED_DARK,hl:$DARK_BACKGROUND,fg:$WHITE_DARK,header:$BLACK_LIGHT,info:$BLUE_LIGHT,pointer:$RED_LIGHT,marker:$RED_DARK,fg+:$WHITE_DARK,prompt:$YELLOW_DARK,hl+:$RED_DARK"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always {}'"

function fzf_open_file() {
    xdg-open "$(find $HOME -type f -name "*" 2>/dev/null | fzf --preview='bat --color=always {}')"
}

export SOUND_CARD_IRQ=169
export BROWSER=/usr/bin/firefox
