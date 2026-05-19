# add_bin_dir_to_path.sh
#
# Adds this project's `bin` directory to the system path.
#
# Requirements:
# * THIS FILE MUST BE SOURCED IN THE SHELL, or the bin dir will not be appended to $PATH.
# * This file must live within the `bin` directory of the project.

errcho () { echo "$@" >&2; }

get_shell_invocation() {
  local shell_pid="${1}"

  # The "=" after "command" disables header output
  ps -o command= "${shell_pid}"
}

get_bin_path () {
  local shell_invocation="${1}"
  errcho "shell invoke: \"${shell_invocation}\"" # DEBUG DELETEME

  if [[ $shell_invocation == *"bash"* ]]; then
    errcho "bash detected" # DEBUG DELETEME
    dirname "$(realpath "${BASH_SOURCE[0]}")"
  elif [[ $shell_invocation == *"zsh"* ]]; then
    errcho "zsh detected" # DEBUG DELETEME
    dirname "$(realpath "${(%):-%x}")"
  elif [[ $shell_invocation == "sh"* ]]; then
    errcho "posix sh detected" # DEBUG DELETEME

    local inv_cmd;   inv_cmd="$(command -v -- "${0}")"
    local real_path; real_path="$(realpath "${inv_cmd}")"
    local bin_dir;   bin_dir="$(dirname "${real_path}")"

    errcho "posix invoke:   ${inv_cmd}" # DEBUG DELETEME
    errcho "posix realpath: ${real_path}" # DEBUG DELETEME
    errcho "posix bin dir:  ${bin_dir}" # DEBUG DELETEME

    echo "${bin_dir}"

    #dirname "$(realpath "$(command -v -- "${0}")")"
  else
    errcho "Unknown shell invoked with \"${shell_invocation}\""
    return 67
  fi
}

SH_PID=$$
echo "SH_PID: ${SH_PID}" # DEBUG DELETEME

SH_INVOKE="$(get_shell_invocation "$SH_PID")"
BIN_DIR="$(get_bin_path "$SH_INVOKE")"

echo "project's bin dir: \"${BIN_DIR}\"" # DEBUG DELETEME

#NEW_PATH="${PATH}:${BIN_DIR}"
#echo -e "\nNEW_PATH:" # DEBUG DELETEME
#echo "${NEW_PATH}" | tr ':' '\n' # DEBUG DELETEME

#export PATH="${PATH}:${BIN_DIR}"
