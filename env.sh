# env.sh
#
# Sets up isolated mise configuration and tool install dirs for Neovim.
#
# Source this file. Don't just execute it.

# Start clean with custom env vars
unset CUR_WRK_DIR
unset NVIM_CONFIG_ROOT
unset NVIM_MISE_GLOBAL_CONFIG_ROOT
unset NVIM_TOOL_INSTALL_ROOT
unset TEST_DIR
unset TEST_DIR_NAME

# Start clean with mise env vars
unset MISE_CEILING_PATHS
unset MISE_ENV
unset MISE_GLOBAL_CONFIG_ROOT
unset MISE_INSTALLS_DIR

# export NVIM_CONFIG_ROOT="${HOME}/.config/nvim"
# export NVIM_TOOL_INSTALL_ROOT="${HOME}/.local/share/nvim"

export CUR_WRK_DIR="$(dirname "$0")"

export TEST_DIR_NAME="__test_dir"
export TEST_DIR="${CUR_WRK_DIR}/${TEST_DIR_NAME}"

export NVIM_CONFIG_ROOT="${TEST_DIR}/config_root"
export NVIM_MISE_GLOBAL_CONFIG_ROOT="${NVIM_CONFIG_ROOT}/mise/"

export NVIM_TOOL_INSTALL_ROOT="${TEST_DIR}/installs"

# config file must be named config.neovim.toml or mise.neovim.toml
#export MISE_ENV="neovim"

# force the global config to live under Neovim's config tree.
export MISE_GLOBAL_CONFIG_ROOT="NVIM_MISE_GLOBAL_CONFIG_ROOT"

# cleaner install of neovim related tools (LSPs and deps) to a dir under neovim's data dir.
export MISE_INSTALLS_DIR="${NVIM_TOOL_INSTALL_ROOT}/mise/installs/"

# prevents merging any config files found above nvim_config_root.
#export MISE_CEILING_PATHS="${NVIM_CONFIG_ROOT}"
#export MISE_CEILING_PATHS="\"${NVIM_CONFIG_ROOT}\""
#export MISE_CEILING_PATHS="NVIM_CONFIG_ROOT"










