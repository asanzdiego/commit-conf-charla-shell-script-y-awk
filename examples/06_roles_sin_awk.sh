#! /bin/bash

roles_file=./05_roles.csv

roles=$(cut -d : -f 2 $roles_file | sed 's/,/\n/g' | sort | uniq)

for rol in $roles; do
  echo -n "${rol} -> "
  echo $(grep -E "${rol}" "${roles_file}" | cut -d : -f 1)
done
