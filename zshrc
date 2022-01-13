source $HOME/dotfiles/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-extras
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# antigen bundle kubectl
antigen bundle docker
antigen bundle docker-compose

# Load bundles from external repos.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

source $HOME/.cargo/env

if [ "$TERM_PROGRAM" != "vscode" ]
then
 if [ "$TMUX" = "" ]; then tmux; fi
fi

alias tmux="tmux attach || tmux new"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh
