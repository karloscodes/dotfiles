eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(~/.local/bin/mise activate zsh)"

if [[ $(uname -m) == 'arm64' ]]; then
  export BREW_PREFIX="/opt/homebrew"
else
  export BREW_PREFIX="/usr/local"
fi

# Add go $HOME binaries to the path
export PATH=$PATH:$HOME/go/bin

# bun completions
[ -s "/Users/karloscodes/.bun/_bun" ] && source "/Users/karloscodes/.bun/_bun"
