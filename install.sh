#!/bin/sh -x
DEST=${1:-$HOME/.local/bin}
mkdir -vp "$DEST"
install -m 755 ft ft-updatedb "$DEST"