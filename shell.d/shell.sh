# Set preferred shell-agnostic configs. Should be
# compatible with bash and zsh

# If we are not running interactively, do nothing
[[ $- != *i* ]] && return

#========#
# Edtior #
#========#

# Set editor. Some tools prefer 'VISUAL', some prefer 'EDITOR'
preferred_editors=(nvim vi)
for editor in ${preferred_editors[@]}; do
    if command -v "${editor}" >/dev/null 2>&1; then
        VISUAL="$(command -v ${editor})"
        EDITOR="${VISUAL}"
        break
    fi
done
unset editor preferred_editors


#============#
# Shell opts #
#============#

# Set a shell option, don't fail if it doesn't exist
safe_set() { shopt -s "$1" >/dev/null 2>&1 || true; }

safe_set cdspell       # Fix minor typos when using 'cd'
safe_set dirspecc      # Fix minor types for other commands


#=========#
# History #
#=========#

# Large history with multi-line command support
safe_set histappend              # Append to hist ory file instead of overwrite
safe_set cmdhist                 # Multi-line commands are one entry
PROMPT_COMMAND='history -a'      # Save history before prompting
export HISTSIZE=10000                     # Keep a long history per session
export HISTFILESIZE=100000                # Keep a longer history in the history file
export HISTCONTROL="ignoreboth:erasedups" # Ignore commands starting with space or duplicate commands
export HISTIGNORE="history:clear"         # List of commands to exclude from history

