#!/usr/bin/env bash
source "$(dirname "$0")/_pkg.sh"

case "$PKG_MANAGER" in 
    brew) pkg_install fnm ;;
esac

fnm install --lts
fnm default lts-latest
