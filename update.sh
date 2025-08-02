#!/bin/bash
echo "Updating dotfiles and system packages..."

# Update Homebrew and packages
if command -v brew &> /dev/null; then
  echo "Updating Homebrew..."
  brew update
  brew upgrade
  brew cleanup
  brew autoremove
fi

# Update mise and managed runtimes
if command -v mise &> /dev/null; then
  echo "Updating mise and runtimes..."
  mise self-update
  mise upgrade
fi

echo "Update complete!"
