# env.sh
#
# Sets up isolated mise configuration and tool install dirs for Neovim.
#
# Source this file. Don't just execute it.

# Config dir structucture:
# $NVIM_CONFIG_ROOT
# └── mise                      NVIM_MISE_GLOBAL_CONFIG_ROOT
#     └── config                NVIM_MISE_CONFIG_DIR
#         └── mise.toml

CUR_WRK_DIR="$(dirname "$0")"

TEST_DIR_NAME="__test_dir"
TEST_DIR="${CUR_WRK_DIR}/${TEST_DIR_NAME}"

# Equivalent of {{ config_root }} for Neovim.
NVIM_CONFIG_ROOT="${TEST_DIR}/config_root"

# Directory under {{ config_root }} that contains the isolated global mise config for Neovim.
NVIM_MISE_GLOBAL_CONFIG_ROOT="${NVIM_CONFIG_ROOT}/mise"

# mise will not load config files from child dirs of {{ config_root }}.
# Config files in {{ config_root }} will be ignored.
NVIM_MISE_CONFIG_DIR="${NVIM_MISE_GLOBAL_CONFIG_ROOT}/config"

# Cleaner install of neovim related tools (LSPs and deps) to a dir under Neovim's data dir.
NVIM_MISE_TOOL_INSTALLS_DIR="${TEST_DIR}/installs"

# ---------------------------------------------------------
# MISE CONFIGURATION ENVIRONMENT VARIABLES
# ---------------------------------------------------------

# Start clean with mise env vars.
unset MISE_CEILING_PATHS
unset MISE_ENV
unset MISE_GLOBAL_CONFIG_ROOT
unset MISE_INSTALLS_DIR

# Config file must be named config.neovim.toml or mise.neovim.toml.
#export MISE_ENV="neovim"

# Force the global config to live under Neovim's config tree by
# making mise's {{ config_root }} live one directory below Neovim's
# Relative paths in environment directives are resolved against {{ config_root }}.
export MISE_GLOBAL_CONFIG_ROOT="${NVIM_MISE_GLOBAL_CONFIG_ROOT}"

# Fully qualified path to the isolated global mise config for Neovim
export MISE_GLOBAL_CONFIG_FILE="${NVIM_MISE_CONFIG_DIR}/mise.toml"

# Prevents merging any config files found above $NVIM_MISE_GLOBAL_CONFIG_ROOT.
export MISE_CEILING_PATHS="${NVIM_MISE_GLOBAL_CONFIG_ROOT}"

# This is where tools are installed to when running mise install/use.
# See:
#     https://mise.jdx.dev/directories.html#local-share-mise-installs
export MISE_INSTALLS_DIR="${NVIM_MISE_TOOL_INSTALLS_DIR}"
