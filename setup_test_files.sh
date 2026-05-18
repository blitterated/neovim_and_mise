#! /opt/homebrew/bin/bash

source "./env.sh"

BACKUP_DIR="test_dir_backups"

# Check if test directory exists. If so, back it up and delete the tree
if [ -d "${test_dir}" ]; then
  TIMESTAMP=$(date +%s)
  BACKUP_FILENAME="${test_dir_name}_${TIMESTAMP}.tgz"

  gtar -czvf "${BACKUP_FILENAME}" "${test_dir_name}"
  mv "${BACKUP_FILENAME}" "${BACKUP_DIR}"
  rm -rf "${TEST_DIR_NAME}"

  echo "Found \"${TEST_DIR}\". Backed up to \"${BACKUP_DIR}/${BACKUP_FILENAME}\""
fi

# Create the folder structure
mkdir -p "${NVIM_CONFIG_ROOT}/mise"
mkdir -p "${NVIM_TOOL_INSTALL_ROOT}"

# Create README for config_root
cat << EOF > "${TEST_DIR}/config_root/README.txt"
When using MISE_CEILING_PATHS, mise will search directories under the directory specified as the ceiling for config files, but _NOT_ the ceiling direct itself.
EOF

# Create mise config file
#cat << 'EOF' > "${test_dir}/config_root/mise/mise.neovim.toml"
cat << 'EOF' > "${test_dir}/config_root/mise/mise.toml"
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
