ZSH=$HOME/.oh-my-zsh

ZSH_THEME="nicoulaj"

# plugins
plugins=(
    git
    history-substring-search
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# aliases
alias ll="ls -alh"
