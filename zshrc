export REPORTTIME=10

#Add ccache to the path
export PATH="/usr/lib64/ccache/bin:$PATH"

export CCACHE_DIR="/var/tmp/ccache"
export CCACHE_SIZE="8G"

export GOPATH="/home/wichtounet/dev/gocode/"

# Force pdflatex to print with lots of columns
export max_print_line=100000

export LD_PRELOAD=""

# Include stuff thas is local to the computer
if [[ -r ~/.local.zshrc ]]; then
	source ~/.local.zshrc
fi

# Enable colors
autoload -U colors && colors

# Allow for functions in the prompt
setopt PROMPT_SUBST

# Configure completion for taskwarrior
fpath=($fpath /usr/local/share/doc/task/scripts/zsh)

# Enable completion
autoload -Uz compinit && compinit

# Enable correction
setopt correctall

# Enable advanced prompt
autoload -U promptinit && promptinit

#Cache for completions
zstyle ':completion::complete:*' use-cache 1

# Completion style improvements
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Group by tag names
zstyle ':completion:*' group-name ''

# Define the output of the time command
TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'

# Basic history configuration
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt inc_append_history

# Improve duplicate configuration
setopt hist_ignore_all_dups

# Enable oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="agnoster"
plugins=(autojump git git-flow taskwarrior)

source $ZSH/oh-my-zsh.sh

#Always display the line where grep found something
alias grep='grep -n'

#Utility aliases for git
alias gc='git commit'
alias gca='git commit -a'
alias gcadd='git add -A'
