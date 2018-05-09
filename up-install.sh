#!/bin/bash
export SCRIPT_DIR
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir ~/bin
ln -sfv "$SCRIPT_DIR/up" ~/bin/up
ln -sfv "$SCRIPT_DIR/up-arch" ~/bin/up-arch
ln -sfv "$SCRIPT_DIR/up-ubuntu" ~/bin/up-ubuntu
