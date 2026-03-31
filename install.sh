#!/usr/bin/env bash

# Source files
source "$(dirname "$0")/scripts/common.sh"
source "$(dirname "$0")/scripts/language_prompt.sh"

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# OS Specific bootstrap
case "$(uname -s)" in
    Darwin)
        echo "[install.sh] Darwin detected"

        # Install Homebrew
        if ! command -v brew &>/dev/null; then
            echo "[install.sh] Installing Homebrew"
            run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        
        # Download brew packages
        run brew bundle --file="$DOTFILES_DIR/Brewfile"

        # Run macos specific setup
        source "$DOTFILES_DIR/scripts/macos.sh"
        ;;
    *)
        echo "[install.sh] Unsupported OS"; exit 1
        ;;
esac

source "$DOTFILES_DIR/scripts/link.sh"

prompt_languages
confirm_selections && install_languages
