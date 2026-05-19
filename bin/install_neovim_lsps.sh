#! /opt/homebrew/bin/bash

# Import mise env vars for an isolated environment for Neovim.
source "../lib/env.dev.sh"
#source "../lib/env.sh"

# Install Neovim LSPs and deps with mise
mise install
