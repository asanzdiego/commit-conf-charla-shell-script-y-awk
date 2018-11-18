# this will run only once at first
BEGIN {
  FS = ",|:"
}

# this will be executed for each of the lines in the file
{
  name=$1
  for (i=2; i<=NF; i++) {
    role=$i
    old_names=roles[role]
    roles[role]=name" "old_names
  }
}

# This will only run once at the end
END {
  for (rol in roles) {
    print rol" -> " roles[rol]
  }
}