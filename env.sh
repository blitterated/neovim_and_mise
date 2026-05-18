# env.sh
#
# Sets up isolated mise configuration and tool install dirs for Neovim.
#
# Source this file. Don't just execute it.

# export nvim_config_root="${HOME}/.config/nvim"
# export nvim_tool_install_root="${HOME}/.local/share/nvim"

script_dir="$(dirname "$0")"
export test_dir="${script_dir}/__test_dir"

export nvim_config_root="${test_dir}/config_root"
nvim_tool_install_root="${test_dir}/installs"

export nvim_mise_global_config_root="${nvim_config_root}/mise/"

# config file must be named config.neovim.toml or mise.neovim.toml
export MISE_ENV="neovim"

# force the global config to live under Neovim's config tree.
#export MISE_GLOBAL_CONFIG_ROOT="${nvim_config_root}/mise/"
export MISE_GLOBAL_CONFIG_ROOT="nvim_mise_global_config_root"

# cleaner install of neovim related tools (LSPs and deps) to a dir under neovim's data dir.
export MISE_INSTALLS_DIR="${nvim_tool_install_root}/mise/installs/"

# prevents merging any config files found above nvim_config_root.
#export MISE_CEILING_PATHS="${nvim_config_root}"

export MISE_CEILING_PATHS="nvim_mise_global_config_root"
