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

# auto start or attach tmux
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi

function faketime () {

  # Store the time server globally for future function calls
  if [[ -z "$TIME_SERVER" ]] ; then
    if ps -p $$ -o cmd= | grep zsh >/dev/null ; then
      # zsh user prompt
      read TIME_SERVER?"Enter the FQDN or IP of the time server: "
    else
      # bash user prompt
      read -p "Enter the FQDN or IP of the time server: " TIME_SERVER
    fi
    export TIME_SERVER="$TIME_SERVER"
  fi

  # Make sure the user has passed a valid target server
  if ! /usr/sbin/ntpdate -t 1 -q "$TIME_SERVER" > /dev/null ; then
    echo "Connectivity test to time server failed: ${TIME_SERVER}"
    unset TIME_SERVER
    return
  # Target NTP server is reachable, proceed
  else
    /usr/bin/faketime "$(/usr/sbin/ntpdate -q $TIME_SERVER | /usr/bin/cut -d ' ' -f 1,2)" $@
  fi
  
}
