# ~/.bashrc

PS1='\u@\h:\w $ '

HISTTIMEFORMAT="%F %T "

export PATH="$HOME/bin:$PATH"

alias ls='ls -F --color=auto'

# Aliases
alias vim="nvim"
alias python="python3"

# Package specific commands
eval "$(fnm env --use-on-cd --shell zsh)" # fnm
