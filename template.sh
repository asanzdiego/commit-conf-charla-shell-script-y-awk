#! /bin/bash

# Small template for my bash shell scripts.

set -o errexit  # the script end if a command fails
set -o pipefail # the script end if a command fails in a pipe
set -o nounset  # the script end if it uses an undeclared variable
# set -o xtrace # if you want to debug

# Defaults values
logLevel=4 #4-debug;3-info;2-success;1-warning;0-error
alpha=true
beta="beta"

# Usage function
usage() {
  echo -n "
SYNOPSIS
  $0 [-a|--alpha] [-b=val|--beta=val]

DESCRIPTION
  Small template for bash shell scripts.

OPTIONS
  -a     --alpha    Description for option a.
  -b=val --beta=val Description for option b.
  -h     --help     Displays this usage message.

RETURN CODES
  1 If error 1 occurs.
  2 If error 2 occurs.
  ...
  N If error N occurs.
"
}

# Log functions
error() {
  printf "\033[0;31m%s\033[0m\n" "$1"
}
warning() {
  if [[ $logLevel -gt 0 ]]; then
    printf "\033[1;33m%s\033[0m\n" "$1"
  fi
}
success() {
  if [[ $logLevel -gt 1 ]]; then
    printf "\033[0;32m%s\033[0m\n" "$1"
  fi
}
info() {
  if [[ $logLevel -gt 2 ]]; then
    printf "\033[0;34m%s\033[0m\n" "$1"
  fi
}
debug() {
  if [[ $logLevel -gt 3 ]]; then
    printf "\033[1;30m%s\033[0m\n" "$1"
  fi
}

# Other functions
print() {
  
  error "error"
  warning "warning"
  success "success"
  info "info"
  debug "debug"

  printf "alpha=%s\n" "${alpha}"
  printf "beta=%s\n" "${beta}"
}

# Params function
params() {

  for param in "$@"; do
    case "${param}" in
      -a|--alpha)
        alpha=true 
        ;;
      -b=*|--beta=*)
        beta=${param#*=}
        ;;
      -h|--nelp)
        usage
        exit 0 # salida sin error
        ;;
      *)
        error "Unknown parameter ${param}"
        exit 1
        ;;
    esac
  done
}

# Main function
main() {

  params "$@"
  print
}

main "$@"