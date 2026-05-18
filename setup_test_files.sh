#! /opt/homebrew/bin/bash

# Same as `set -eu`
set -o errexit -o nounset

source "./env.dev.sh"

BACKUP_DIR="test_dir_backups"

# Check if test directory exists. If so, back it up and delete the tree
if [ -d "${TEST_DIR}" ]; then
  TIMESTAMP=$(date +%s)
  BACKUP_FILENAME="${TEST_DIR_NAME}_${TIMESTAMP}.tgz"

  gtar -czvf "${BACKUP_FILENAME}" "${TEST_DIR_NAME}"
  mv "${BACKUP_FILENAME}" "${BACKUP_DIR}"
  rm -rf "${TEST_DIR_NAME}"

  echo "Found \"${TEST_DIR}\". Backed up to \"${BACKUP_DIR}/${BACKUP_FILENAME}\""
fi

# Create the folder structure
mkdir -p "${NVIM_MISE_CONFIG_DIR}"
mkdir -p "${NVIM_TOOL_INSTALL_ROOT}"

# Create README for config_root
cat << EOF > "${NVIM_CONFIG_ROOT}/README.txt"
When using MISE_CEILING_PATHS, mise will search directories under the directory specified as the ceiling for config files, but _NOT_ the ceiling direct itself.
EOF

# Create mise config file
#cat << 'EOF' > "${NVIM_MISE_CONFIG_DIR}/mise.neovim.toml"
 cat << 'EOF' > "${NVIM_MISE_CONFIG_DIR}/mise.toml"
[tools]
node = "lts"
"aqua:LuaLS/lua-language-server" = "latest"
"aqua:koalaman/shellcheck"       = "latest"
"go:mvdan.cc/sh/v3/cmd/shfmt"    = "latest"
"npm:bash-language-server"       = { version = "latest", depends = ["aqua:koalaman/shellcheck", "go:mvdan.cc/sh/v3/cmd/shfmt"] }
"npm:prettier"                   = "latest"
"npm:prettier-plugin-awk"        = { version = "latest", depends = ["npm:prettier"] }
"npm:npm:prettier-plugin-awk"    = { version = "latest", depends = ["npm:prettier", "npm:prettier-plugin-awk"] }
EOF
