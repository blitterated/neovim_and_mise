# shared_functions.sh
#
# Shared functions that are used early to determine paths to binaries and deps

errcho () { echo "$@" >&2; }

get_shell_invocation() {
  local shell_pid="${1}"

  # The "=" after "command" disables header output
  ps -o command= "${shell_pid}"
}

get_bin_path_from_lib_path () {
  local script_rel_path="${1}"

  local script_full_path
  local lib_dir_path
  local grandparent_path
  local bin_dir_path

  script_full_path="$(realpath "${script_rel_path}")"
  lib_dir_path="$(dirname "${script_full_path}")"
  grandparent_path="$(dirname "${lib_dir_path}")"
  bin_dir_path="${grandparent_path}/bin"

  errcho "script_rel_path:  [${script_rel_path}]"  # DEBUG DELETEME
  errcho "script_full_path: [${script_full_path}]" # DEBUG DELETEME
  errcho "lib_dir_path:     [${lib_dir_path}]"     # DEBUG DELETEME
  errcho "grandparent_path: [${grandparent_path}]" # DEBUG DELETEME
  errcho "bin_dir_path:     [${bin_dir_path}]"     # DEBUG DELETEME

  echo "${bin_dir_path}"
}

get_bin_path () {
  local shell_invocation="${1}"

  if [[ $shell_invocation == *"bash"* ]]; then
    get_bin_path_from_lib_path "${BASH_SOURCE[0]}"
  elif [[ $shell_invocation == *"zsh"* ]]; then
    get_bin_path_from_lib_path "${(%):-%x}"
  else
    # Sorry POSIX shell. You've got no reliable way to retrieve a fully qualified path to a sourced script.
    errcho "Unsupported shell. Invocation: \"${shell_invocation}\""
    return 67
  fi
}
