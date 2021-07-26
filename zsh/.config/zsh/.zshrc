#~/.config/zsh/.zshrc

PATH=$PATH:/usr/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin/:/home/jeffrey/.scripts:/home/jeffrey/.scripts/bin:/home/jeffrey/.scripts/Shell:/home/jeffrey/.scripts/Python

export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='st'
export BROWSER='brave'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Alias'
alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias suckless='cd /home/jeffrey/.config/suckless'
alias music='ncmpcpp'
alias open='xdg-open'

RANGER_LOAD_DEFAULT_RC=FALSE 

## less display colors
#export LESS_TERMCAP_mb=$'\e[1;31m'          # begin bold
#export LESS_TERMCAP_md=$'\e[1;94m'          # begin blink
#export LESS_TERMCAP_so=$'\e[43;30m'         # begin reverse text
#export LESS_TERMCAP_us=$'\e[4;35m'          # begin underline
#export LESS_TERMCAP_me=$'\e[0m'             # reset bold/blink 
#export LESS_TERMCAP_se=$'\e[0m'             # reset reverse text
#export LESS_TERMCAP_ue=$'\e[0m'             # reset underline

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

echo "ZSH settings loaded"
