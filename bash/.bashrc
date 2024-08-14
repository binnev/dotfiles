#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.local/bin:$PATH"

################################### ALIASES ###################################

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ll="ls -al"

# zoxide = smarter `cd` command
eval "$(zoxide init bash)"
alias cd="z"
alias cdi="zi"

alias ff="fastfetch"
alias ll="ls -alh"
alias dots="code ~/dotfiles"

# do `something | copy` to copy the output of `something` to system clipboard
alias copy="xclip -selection clipboard"

# git 
alias gst="git status"
alias glog="git log"

# essential
alias shrug='echo "¯\_(ツ)_/¯" | copy'

################################# RUST #################################
# Thanks Jeremy Chone for this idea 
# https://www.youtube.com/watch?v=gyoPFZ0Qjlw

# Cargo watch install
function cwi() {
    cargo watch -x "install --path ."
}

# cargo watch example
# usage `cwe xp_file_name`
function cwe() {
    cargo watch -q -c -x "run -q --example '$1'"
}

################################# OTHER #################################

eval "$(starship init bash)"

# Include .bashrc_local if it exists.
# This can be used to define machine-specific stuff
if [ -f "$HOME/.bashrc_local" ]; then
    . "$HOME/.bashrc_local"
fi
. "$HOME/.cargo/env"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR='nano'
