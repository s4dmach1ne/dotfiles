# Performance optimizations
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"

# Theme config
ZSH_THEME="strug"

# Carefully ordered plugins (syntax highlighting must be last)
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
  fzf
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Autosuggest settings
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# coloring
ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[directory]='fg=green'


# aliases
alias ip='ip --color=auto'               # Color for ip command
alias ls='ls --color=auto'               # Color for ls
alias grep='grep --color=auto'           # Color for grep
alias fgrep='fgrep --color=auto'         # Color for fgrep
alias egrep='egrep --color=auto'         # Color for egrep


# Created by `pipx` on 2025-03-04 11:48:32
export PATH="$PATH:/home/rei/.local/bin"
