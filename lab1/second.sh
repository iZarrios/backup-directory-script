#! /bin/bash

if (( $# < 1 ))
then
    dirs="."
else
    dirs=$*
fi


count=0


for dir in $dirs
do
    echo $dir
    for file in $dir/*
    do
        echo "$count: $file"
        count=`expr $count + 1`
    done
done

echo "$count files found"
