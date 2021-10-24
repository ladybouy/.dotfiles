#!/bin/sh

export PATH=$PATH:$HOME/.scripts:$HOME/.scripts/bin:$HOME/.scripts/shell:$HOME/.scripts/Python

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
