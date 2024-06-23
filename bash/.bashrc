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

# alias standup='open "https://deliverect.zoom.us/j/98634749082?pwd=T3dLZ1FmeEJD>

eval "$(starship init bash)"

