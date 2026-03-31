#!/usr/bin/env bash
[ -n "$COMMON_SOURCED" ] && return
COMMON_SOURCED=true

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DRY_RUN=${DRY_RUN:-false}
run() {
  if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] $*"
  else
    "$@"
  fi
}
