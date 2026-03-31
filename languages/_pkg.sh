#!/usr/bin/env bash
source "$(dirname "$0")/../scripts/common.sh"

if command -v brew &>/dev/null; then
    PKG_MANAGER="brew"
else
    echo "No supported package manager found"; exit 1
fi

pkg_install() {
    case "$PKG_MANAGER" in
        brew)    run brew install "$@" ;;
    esac
}
