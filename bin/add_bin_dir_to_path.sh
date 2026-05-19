#! /opt/homebrew/bin/bash

# add_bin_dir_to_path.sh
#
# Adds this project's `bin` directory to the system path.
#
# This requires that add_bin_dir_to_path.sh lives within the `bin` directory of this project.

SELF_FULL_PATH="$(realpath "${BASH_SOURCE[0]}")"
BIN_DIR="$(dirname "${SELF_FULL_PATH}")"

#echo "project's bin dir: \"${BIN_DIR}\"" # DEBUG DELETEME

NEW_PATH="${PATH}:${BIN_DIR}"
echo -e "\nNEW_PATH:" # DEBUG DELETEME
echo "${NEW_PATH}" | tr ':' '\n' # DEBUG DELETEME

#export PATH="${PATH}:${BIN_DIR}"
