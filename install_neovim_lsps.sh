#! /opt/homebrew/bin/bash

# Import mise env vars for an isolated environment for Neovim.
source ./env.sh

# Install Neovim LSPs and deps with mise
mise install

# Explicitly use env vars for invocation
# MISE_ENV="neovim" MISE_GLOBAL_CONFIG_ROOT="${nvim_config_root}/mise/" MISE_INSTALLS_DIR="${nvim_tool_install_root}/mise/installs/" MISE_CEILING_PATHS="${nvim_config_root}" mise install
