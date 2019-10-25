DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
unlink ~/.vimrc
unlink ~/.zshrc
unlink ~/.fzf
unlink ~/.tmux.conf

ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/zshrc" ~/.zshrc
ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/fzf" ~/.fzf
ln -s "$DIR/tmux.conf" ~/.tmux.conf

git submodule init
git submodule update

$DIR/fzf/install

zsh

echo "All dotfiles have been installed :)"

