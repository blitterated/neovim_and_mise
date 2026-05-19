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

  if [[ $shell_invocation == *"bash"* ]]; then
    dirname "$(realpath "${BASH_SOURCE[0]}")"
  elif [[ $shell_invocation == *"zsh"* ]]; then
    dirname "$(realpath "${(%):-%x}")"
  else
    # Sorry POSIX shell, but you've got no reliable way to get a fully qualified path to a sourced script.
    errcho "Unknown shell invoked with \"${shell_invocation}\""
    return 67
  fi
}

SH_PID=$$
SH_INVOKE="$(get_shell_invocation "$SH_PID")"
BIN_DIR="$(get_bin_path "$SH_INVOKE")"

export PATH="${PATH}:${BIN_DIR}"
