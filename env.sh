# env.sh
#
# Sets up isolated mise configuration and tool install dirs for Neovim.
#
# Source this file. Don't just execute it.

# export NVIM_CONFIG_ROOT="${HOME}/.config/nvim"
# export NVIM_TOOL_INSTALL_ROOT="${HOME}/.local/share/nvim"

export CUR_WRK_DIR="$(dirname "$0")"

export TEST_DIR_NAME="__test_dir"
export TEST_DIR="${CUR_WRK_DIR}/${TEST_DIR_NAME}"

export NVIM_CONFIG_ROOT="${TEST_DIR}/config_root"
export NVIM_TOOL_INSTALL_ROOT="${TEST_DIR}/installs"

export NVIM_MISE_GLOBAL_CONFIG_ROOT="${NVIM_CONFIG_ROOT}/mise/"

# config file must be named config.neovim.toml or mise.neovim.toml
export MISE_ENV="neovim"

# force the global config to live under Neovim's config tree.
#export MISE_GLOBAL_CONFIG_ROOT="${nvim_config_root}/mise/"
export MISE_GLOBAL_CONFIG_ROOT="nvim_mise_global_config_root"

# cleaner install of neovim related tools (LSPs and deps) to a dir under neovim's data dir.
export MISE_INSTALLS_DIR="${NVIM_TOOL_INSTALL_ROOT}/mise/installs/"

# prevents merging any config files found above nvim_config_root.
#export MISE_CEILING_PATHS="${NVIM_CONFIG_ROOT}"

export MISE_CEILING_PATHS="nvim_mise_global_config_root"
