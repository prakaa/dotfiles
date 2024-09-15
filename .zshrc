#~!
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add additional bin directories to PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Default editor setting
export EDITOR="nvim"

# Add neovim to PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~zsh Configuration~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Aliases
alias n="nvim"
alias ls="eza"
alias reload="source $HOME/.zshrc"

## Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add"
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg="git log --graph --oneline --decorate --all"
alias gdf="git diff"

# completion options
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate #en

# forward and backward words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~Application Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/abi/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#
# Julia defaults
export JULIA_NUM_THREADS=15

# Rye
. "$HOME/.rye/env"

# Gurobi
export GUROBI_HOME="/opt/gurobi951/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

# Go
export PATH=$PATH:/usr/local/go/bin

# auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"
