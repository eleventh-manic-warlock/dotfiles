#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source shell setup script
if [ -f ~/.config/shell.d/shell.sh ]; then
    source ~/.config/shell.d/shell.sh
fi

# Source any defined aliases
if [ -f ~/.config/shell.d/aliases ]; then
    source ~/.config/shell.d/aliases
fi

# Add custom scripts to PATH
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(mise activate bash)"
