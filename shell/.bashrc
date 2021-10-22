# ~/.bashrc

PATH=$PATH:/usr/bin/:/usr/sbin:/usr/local/bin:/usr/local/sbin/:$HOME/.scripts:$HOME/.scripts/bin:$HOME/.scripts/shell:$HOME/.scripts/Python/:/$HOME/.local/bin

RANGER_LOAD_DEFAULT_RC=FALSE 

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=/bin/vim
export VISUAL=/bin/vim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lh --color=auto'
alias grep='grep --color=auto' 
alias suckless='cd $HOME/.config/suckless'
alias music='ncmpcpp'
alias open='xdg-open'

PS1='\[\033[01;34m\]\u\[\033[01;37m\]@\[\033[01;33m\]\h \[\033[01;37m\]\W\[\033[0m\] \$ \[\033[m\]'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Less display colors 
export LESS_TERMCAP_mb=$'\e[1;31m'          # begin bold
export LESS_TERMCAP_md=$'\e[1;94m'          # begin blink
export LESS_TERMCAP_so=$'\e[43;30m'         # begin reverse text
export LESS_TERMCAP_us=$'\e[4;33m'          # begin underline
export LESS_TERMCAP_me=$'\e[0m'             # reset bold/blink 
export LESS_TERMCAP_se=$'\e[0m'             # reset reverse text
export LESS_TERMCAP_ue=$'\e[0m'             # reset underline
