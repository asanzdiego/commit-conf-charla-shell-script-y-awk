#! /bin/bash

# script that shows information about parameters
# and that verifies that at least one parameter is introduced

set -o errexit  # the script ends if a command fails
set -o pipefail # the script ends if a command fails in a pipe
set -o nounset  # the script ends if it uses an undeclared variable
# set -o xtrace # if you want to debug

# Defaults values
default_2="Commit Conf"
date=$(date +'%Y-%m-%d %H:%M:%S')

# Other functions
print() {

  echo "${global_param_1} ${global_param_2}"
  echo "${date}"
}

# Check function
check() {

  local function_num_params=$#        # the numbers of function params is assigned as local variable

  if [[ $function_num_params -lt 1 ]]; then
    echo "At least one parameter must be introduced."
    exit 1 # exit with a return code > 0
  fi
}

# Params function
params() {

  global_param_1="$1"               # the first function param is assigned as global
  global_param_2=${2:-${default_2}} # the second function param is assigned as global (with default value)
}

# Main function
main() {

  check "$@"
  params "$@"
  print
}

main "$@" # call the main function with all the parameters