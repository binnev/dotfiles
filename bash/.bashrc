#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin

################################### ALIASES ###################################
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ff="fastfetch"
alias ll="ls -alh"
alias newest="ls -t | head -n 1"  # gets the name of the most recently modified file
alias dots="code ~/dotfiles"

# do `something | copy` to copy the output of `something` to system clipboard
alias copy="xclip -selection clipboard"

# git 
alias gst="git status"
alias glog="git log"
alias gcl="git clone"
alias gcm="git commit -m"

# lazygit/docker 
alias lzg="lazygit"
alias lzd="lazydocker"

# essential
alias shrug='echo "¯\_(ツ)_/¯" | copy'

function decode() {
    echo $1 | base64 -d
}

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

# cargo watch test 
# usage: 
# `cwt` to run all tests 
# `cwt test_name`
# `cwt test1 test2`
function cwt() {
    if [[ $# -eq 1 ]]; then 
        cargo watch -q -c -x "test '$1' -- --nocapture"
    elif [[ $# -eq 2 ]]; then 
        cargo watch -q -c -x "test --test '$1' '$2' -- --nocapture"
    else
        cargo watch -q -c -x "test -- --nocapture"
    fi
}

################################# OTHER #################################

eval "$(starship init bash)"

eval "$(direnv hook bash)"

# Include .bashrc_local if it exists.
# This can be used to define machine-specific stuff
if [ -f "$HOME/.bashrc_local" ]; then
    . "$HOME/.bashrc_local"
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# export EDITOR='nano'
export EDITOR='code --wait'

alias mirrors='sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist'

alias rebuild='~/dotfiles/nixos/rebuild.sh'

# zoxide = smarter `cd` command
eval "$(zoxide init bash)"
alias cd="z"
alias cdi="zi"