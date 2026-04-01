#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

# Link docker-compose as docker plugin
echo "Linking docker-compose as docker plugin"
run mkdir -p ~/.docker/cli-plugins/ && ln $(which docker-compose) ~/.docker/cli-plugins/
