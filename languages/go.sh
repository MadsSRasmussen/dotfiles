#!/usr/bin/env bash
source "$(dirname "$0")/_pkg.sh"

case "$PKG_MANAGER" in
    brew) pkg_install go ;;
esac
