#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
brew install git git-extras
