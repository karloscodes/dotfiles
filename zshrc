# ==============================================================================
# ZSH Configuration
# ==============================================================================

# Path configuration
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# ==============================================================================
# History Configuration
# ==============================================================================
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# ==============================================================================
# Shell Options
# ==============================================================================
# Enable case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB

# Enable extended globbing
setopt EXTENDED_GLOB

# Automatically change directory if command is a directory
setopt AUTO_CD

# Automatically list choices on an ambiguous completion
setopt AUTO_LIST

# Use menu selection for completions
setopt MENU_COMPLETE

# ==============================================================================
# Completion System
# ==============================================================================
# Fix insecure directories warning by setting proper permissions
if type brew &>/dev/null; then
    # Fix Homebrew directory permissions for zsh completion
    ZSH_DISABLE_COMPFIX=true
    autoload -Uz compinit
    
    # Check for insecure directories and fix them
    for dir in ${BREW_PREFIX:-/opt/homebrew}/share/zsh-completions ${BREW_PREFIX:-/opt/homebrew}/share/zsh ${BREW_PREFIX:-/usr/local}/share/zsh-completions ${BREW_PREFIX:-/usr/local}/share/zsh; do
        if [[ -d "$dir" ]]; then
            chmod -R go-w "$dir" 2>/dev/null || true
        fi
    done
    
    # Initialize completion system with insecure directory bypass
    compinit -u
else
    # Standard initialization for non-Homebrew systems
    autoload -Uz compinit
    compinit
fi

# Load zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# ==============================================================================
# Plugin Loading
# ==============================================================================
# Load zsh-autosuggestions
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Load zsh-syntax-highlighting (must be loaded last)
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ==============================================================================
# Environment Variables
# ==============================================================================
# Determine Homebrew prefix
if [[ $(uname -m) == 'arm64' ]]; then
  export BREW_PREFIX="/opt/homebrew"
else
  export BREW_PREFIX="/usr/local"
fi

# Language environment
# export LANG=en_US.UTF-8

# Preferred editor
# export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# ==============================================================================
# Path Extensions
# ==============================================================================
# Add go binaries to path
export PATH=$PATH:$HOME/go/bin

# ==============================================================================
# Aliases
# ==============================================================================
# Brew maintenance aliases
alias brewup="brew update && brew upgrade && brew cleanup && brew autoremove"
alias brewclean="brew cleanup && brew autoremove && brew doctor"

# Zellij aliases
alias zj="zellij"
alias zja="zellij attach"
alias zjl="zellij list-sessions"
alias zjk="zellij kill-session"
alias zjka="zellij kill-all-sessions"

# Editor aliases
alias nv="nvim"
alias v="nvim"

# ==============================================================================
# External Tool Initialization
# ==============================================================================
# Initialize fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Initialize mise (runtime version manager)
if [ -f ~/.local/bin/mise ]; then
  eval "$(~/.local/bin/mise activate zsh)"
fi

# Auto-start Zellij if not already inside a session
# if command -v zellij &> /dev/null && [ -z "$ZELLIJ" ]; then
#     zellij attach --create
# fi


# opencode
export PATH=/Users/karloscodes/.opencode/bin:$PATH

# Added by Antigravity
export PATH="/Users/karloscodes/.antigravity/antigravity/bin:$PATH"
