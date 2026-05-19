#! /opt/homebrew/bin/bash

# Import mise env vars for an isolated environment for Neovim.
source "../lib/env.dev.sh"

env | ggrep "MISE_"

# Show mise's configuration hierarchy
mise config ls
