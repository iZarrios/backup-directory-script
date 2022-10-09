#! /bin/bash

# this scrtip prints hello to all the friends that you pass as parameeter


if (( $# < 1 ))
then
    echo
    echo "$0 needs at least one argument"
    echo " Eg. "
    echo " $0 Micky, Donald Daisy"
fi

for f in $*
do
    echo "Hello, $f"
done
