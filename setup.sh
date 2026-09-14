#!/bin/bash
# astro-school setup
# One command, sets up a Mac for building Astro sites.
# Safe to run more than once. Backs up anything it replaces.

set -e

REPO="https://github.com/CaraCodeDev/astro-school.git"
DIR="$HOME/repo/astro-school"

bold() { printf "\n\033[1m%s\033[0m\n" "$1"; }

# ---------------------------------------------------------------
bold "1/6  Apple command line tools"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo
  echo "A dialog just opened. Click Install and wait for it to finish."
  echo "Then run this same command again."
  exit 0
fi
echo "already installed"

# ---------------------------------------------------------------
bold "2/6  Homebrew"
if ! command -v brew >/dev/null 2>&1 && [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "ok: $(brew --version | head -1)"

# ---------------------------------------------------------------
bold "3/6  Get the setup files"
mkdir -p "$HOME/repo"
if [ -d "$DIR/.git" ]; then
  git -C "$DIR" pull --quiet
else
  git clone --quiet "$REPO" "$DIR"
fi

# ---------------------------------------------------------------
bold "4/6  Install tools and apps (this is the slow bit)"
brew bundle --file="$DIR/Brewfile"

# ---------------------------------------------------------------
bold "5/6  Terminal config"
install_file() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -f "$dest" ] && ! cmp -s "$src" "$dest"; then
    cp "$dest" "$dest.backup-$(date +%Y%m%d-%H%M%S)"
    echo "backed up existing $dest"
  fi
  cp "$src" "$dest"
  echo "installed $dest"
}
install_file "$DIR/dotfiles/zshrc"          "$HOME/.zshrc"
install_file "$DIR/dotfiles/starship.toml"  "$HOME/.config/starship.toml"
install_file "$DIR/dotfiles/ghostty-config" "$HOME/.config/ghostty/config"

git config --global init.defaultBranch main
git config --global pull.rebase false

if [ -z "$(git config --global user.name)" ]; then
  echo
  echo "Git puts your name on every change you make."
  read -rp "Your name: " name
  read -rp "Your email (same one as GitHub): " email
  git config --global user.name "$name"
  git config --global user.email "$email"
fi

# ---------------------------------------------------------------
bold "6/6  Log in to GitHub"
if ! gh auth status >/dev/null 2>&1; then
  echo "Pick: GitHub.com, HTTPS, Yes (authenticate git), Login with a web browser."
  echo
  gh auth login
else
  echo "already logged in as $(gh api user -q .login)"
fi

# ---------------------------------------------------------------
bold "Done."
echo "Quit this Terminal and open Ghostty from Applications."
echo "You should see a coloured prompt. Type  ls  and press Enter."
