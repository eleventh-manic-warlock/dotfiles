#
# ~/.zshrc
#

##########################
#   Completion Configs   #
##########################
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/warlock/.zshrc'

autoload -Uz compinit
compinit

bindkey -v    # Use vim bindings for zsh completion menus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source any non-hidden customization files defined in ~/.shell.d
# if [ -x ~/.shell.d ]; then
#     for shellfile in ~/.shell.d/*; do
#         [ -r "$shellfile" ] && source "$shellfile"
#     done
#     unset shellfile
# fi

# Source shell setup script
if [ -f ~/.config/shell.d/shell.sh ]; then
    source ~/.config/shell.d/shell.sh
fi

# Source any defined aliases
if [ -f ~/.config/shell.d/aliases ]; then
    source ~/.config/shell.d/aliases
fi


################
#    Prompt    #
################
# Unfussy default
# PS1='[%n@%m %1~]%# '

# Enable precision datetime display and substitution
zmodload zsh/datetime
setopt prompt_subst

# Git status
# Expected Output: main ●1 ✚2 …3
git_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch=$(git branch --show-current)
    local staged=$(git diff --cached --numstat | wc -l | tr -d ' ')
    local unstaged=$(git diff --numstat | wc -l | tr -d ' ')
    local untracked=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')

    echo -n "%F{yellow}($branch)%f "
    [[ $staged -gt 0 ]] && echo -n "%F{green}●$staged%f "
    [[ $unstaged -gt 0 ]] && echo -n "%F{red}✚$unstaged%f "
    [[ $untracked -gt 0 ]] && echo -n "%F{blue}…$untracked%f "
  fi
}

# Precision time
# Expected Output: [HH:MM:SS.mmm AM/PM]
precise_time() {
  local ms=${EPOCHREALTIME#*.}
  echo "%D{%I:%M:%S}.${ms:0:4} %D{%p}"
}

# Define multi-line prompt:
PROMPT='%(?.%f.%F{1})╭─%f[$(precise_time)] %F{cyan}%3~%f $(git_info)
%(?.%f.%F{1})╰─%(!..󰄾)%f '

# mise version manager activation
eval "$(mise activate zsh)"
