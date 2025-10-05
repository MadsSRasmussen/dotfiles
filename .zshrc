# History settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Prompt
precmd() {
    git_branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2)
    PS1="%B%F{blue}%~%b %F{red}${git_branch:+(}$git_branch${git_branch:+)} %f%B%#%b "
}

# PATH configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

# Aliases
alias vim="nvim"
alias python="python3"
