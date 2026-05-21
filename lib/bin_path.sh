# bin_path.sh
#
# Adds this project's `bin` directory to the system path.
#
# Requirements:
# * THIS FILE MUST BE SOURCED IN THE SHELL, or the bin dir will not be appended to $PATH.
# * This file must live within the `bin` directory of the project.

SFUNC_PATH="${BASH_SOURCE[0]}/lib/shared_functions.sh"
echo "SFUNC_PATH: [${SFUNC_PATH}]"
source  "${SFUNC_PATH}"

SH_PID=$$
SH_INVOKE="$(get_shell_invocation "$SH_PID")"
BIN_DIR="$(get_bin_path "$SH_INVOKE")"

export PATH="${PATH}:${BIN_DIR}"
