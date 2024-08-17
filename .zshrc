# auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Julia
export JULIA_NUM_THREADS=15

# Gurobi
export GUROBI_HOME="/opt/gurobi951/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

# Go
export PATH=$PATH:/usr/local/go/bin

# Editor for tmux
export EDITOR="nvim"

# Aliases
alias n='nvim'

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/abi/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
# Rye
. "$HOME/.rye/env"

# completion options
zstyle ':completion:*' menu select

# forward and backward words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"
