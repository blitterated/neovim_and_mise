# env.sh
#
# Sets up isolated mise configuration and tool install dirs for Neovim.
#
# Source this file. Don't just execute it.

# export nvim_config_root="${HOME}/.config/nvim"
# export nvim_tool_install_root="${HOME}/.local/share/nvim"

export nvim_config_root="${HOME}/Development/blitterated/neovim_and_mise/__test_dir/config_root"
export nvim_tool_install_root="${HOME}/Development/blitterated/neovim_and_mise/__test_dir/installs"

# config file must be named config.neovim.toml or mise.neovim.toml
export MISE_ENV="neovim"

# force the global config to live under Neovim's config tree.
export MISE_GLOBAL_CONFIG_ROOT="${nvim_config_root}/mise/"

# cleaner install of neovim related tools (LSPs and deps) to a dir under neovim's data dir.
export MISE_INSTALLS_DIR="${nvim_tool_install_root}/mise/installs/"

# prevents merging any config files found above nvim_config_root.
export MISE_CEILING_PATHS="${nvim_config_root}"
