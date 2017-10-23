#!/bin/sh

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
debug=''
verbose=0

show_help() {
    echo 'Help'
    echo $verbose
}

while getopts ":h:v" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  verbose=1
        ;;
    f)  output_file=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

echo "verbose=$verbose, output_file='$output_file', Leftovers: $@"

# End of file
