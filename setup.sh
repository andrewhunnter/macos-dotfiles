#!/bin/bash

set -e

echo "📦 Installing Homebrew if not installed..."
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "🔗 Symlinking dotfiles..."
ln -sf "$HOME/.dotfiles/zshrc" "$HOME/.zshrc"
ln -sf "$HOME/.dotfiles/gitconfig" "$HOME/.gitconfig"

echo "🍺 Installing Homebrew packages from Brewfile..."
brew bundle --file="$HOME/.dotfiles/Brewfile"

echo "✅ All set. Open a new terminal window or run: source ~/.zshrc"

