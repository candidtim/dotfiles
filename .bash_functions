# Calculates in bc, prints result and exits
# example:
# calc "1 + 2"
calc() { echo $1 | bc -l }

# Highlights matches in the output:
# example:
# helm install | hl configured
hl () { grep --color -E "$1|$" ; }


