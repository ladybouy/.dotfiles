#!/bin/sh

PATH=$PATH:/usr/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin/:/home/jeffrey/.scripts:/home/jeffrey/.scripts/bin:/home/jeffrey/.scripts/Shell:/home/jeffrey/.scripts/Python

# Completions
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit

# Functions
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-alias"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-prompt"

# Plugins
#zsh_add_plugin "zsh-users/zsh_autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jeffrey/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jeffrey/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jeffrey/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jeffrey/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

RANGER_LOAD_DEFAULT_RC=FALSE 

## less display colors
#export LESS_TERMCAP_mb=$'\e[1;31m'          # begin bold
#export LESS_TERMCAP_md=$'\e[1;94m'          # begin blink
#export LESS_TERMCAP_so=$'\e[43;30m'         # begin reverse text
#export LESS_TERMCAP_us=$'\e[4;35m'          # begin underline
#export LESS_TERMCAP_me=$'\e[0m'             # reset bold/blink 
#export LESS_TERMCAP_se=$'\e[0m'             # reset reverse text
#export LESS_TERMCAP_ue=$'\e[0m'             # reset underline

echo "ZSH settings loaded"
