#! /opt/homebrew/bin/bash

BACKUP_DIR="test_dir_backups"

TEST_ROOT="."
TEST_DIR="__test_dir"

# Check if test directory exists. If so, back it up and delete the tree
if [ -d "${TEST_ROOT}/${TEST_DIR}" ]; then
  TIMESTAMP=$(date +%s)
  BACKUP_FILENAME="${TEST_DIR}_${TIMESTAMP}.tgz"

  gtar -czvf "${BACKUP_FILENAME}" "${TEST_DIR}"
  mv "${BACKUP_FILENAME}" "${BACKUP_DIR}"
  rm -rf "${TEST_DIR}"

  echo "Found \"${TEST_ROOT}/${TEST_DIR}\". Backed up to \"${BACKUP_DIR}/${BACKUP_FILENAME}\""
fi

# Create the folder structure
mkdir -p "${TEST_ROOT}/${TEST_DIR}/config_root/config"
mkdir -p "${TEST_ROOT}/${TEST_DIR}/installs"

# Create README for config_root
cat << EOF > "${TEST_ROOT}/${TEST_DIR}/config_root/README.txt"
When using MISE_CEILING_PATHS, mise will search directories under the directory specified as the ceiling for config files, but _NOT_ the ceiling direct itself.
EOF

# Create mise config file
cat << 'EOF' > "${TEST_ROOT}/${TEST_DIR}/config_root/config/mise.neovim.toml"
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
