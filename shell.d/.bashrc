#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source any non-hidden customization files defined in ~/.shell.d
if [ -x ~/.shell.d ]; then
    for shellfile in ~/.shell.d/*; do
        [ -r "$shellfile" ] && source "$shellfile"
    done
    unset shellfile
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(mise activate bash)"
