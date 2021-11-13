# Calculates in bc, prints result and exits
# example:
# calc "1 + 2"
calc() {
  echo $1 | bc -l
}

# Highlights matches in the output:
# example:
# helm install | hl configured
hl () {
  grep --color -E "$1|$" ;
}

# Create a "mark" for the current directory. Marks are created in the
# CDPATH, so can later `cd` directly into the marked directory by its mark name
m () {
  ln -sr "$(pwd)" ~/.marks/@"$1"
}

# Run a project script file, if available.
# When executed in a directory with a `scripts` sub-directory,
# execute the named script and pass all remaining arguments.
# If the script is not found,
run () {
  if [ -f "./scripts/$1" ]; then
    "./scripts/$1" "${@:2}"
  elif [ -f ./scripts/help ]; then
    ./scripts/help --quiet
  elif [ -d ./scripts ]; then
    ls -1 ./scripts
  else
    echo "'scripts' directory is not found"
  fi
}
