#! /bin/bash

# helper function incase of faulty args

error_args(){
    echo "./backupd.sh DIR BACKUPDIR INTERVAL-SECS MAX-BACKUPS"
    exit 1
}

# regular expression for numerical validation
re="^[0-9]+$" # keep searching for 1-9 values until false

if [[ $# < 4 ]] 
then
    # if wrong number of args
    error_args
else

    if [[ $1 == "." ]]
    then
        dir=$(pwd)
    else
        dir=$(realpath $1) # or we can use $(relapath($1))
    fi

    if [[ $2 == "." ]]
    then
        error_args
    else
        backupdir=$(realpath $2) # or we can use $(relapath($2))
    fi

    if ! [[ $3 =~ $re ]] ; then
        echo "error: Not a number" 
        error_args
    else
        interval=$3 # what if the value is 0? sleep 0
    fi

    if ! [[ $4 =~ $re ]] ; then
        echo "error: Not a number" 
        error_args
    else
        if [[ $4 == 0 ]]; then # what if the value is 0
            echo "max_backups cannot be less than 1"
            exit 1
        fi
        max_backups=$4 
    fi
fi

if [[ -d $backupdir ]] 
then
    echo "$(realpath $backupdir)...already exists"
    echo "Care that maybe another directory is already backed up in $backupdir"
else
    echo "Created $backupdir"
    mkdir $backupdir
fi

cd $backupdir

ls -lr $dir > directory-info.last

date_fmt=$(date +"%Y-%m-%d-%H-%M-%S")

mkdir $date_fmt
cp -r $dir $date_fmt


ls -lr $dir > directory-info.new

if ! cmp -s "directory-info.last" "directory-info.new"; then
    echo "updated - Making new backup"
    mkdir $(date +"%Y-%m-%d-%H-%M-%S")
    cp -r $dir $(date +"%Y-%m-%d-%H-%M-%S")
    ls -lr $dir > directory-info.last
fi
count=$(ls | wc -l)
count=`expr $count - 2` # not counting directory-info-* files

    # TODO maybe change it to a while loop
    if [[ $count > $max_backups ]]; then
        file_delete=$(ls  | sort | head -1) # no need for piping to sort program as ls/ ls -r already outputs sorted manner.
        count=`expr $count - 1`
        echo "Deleted...$file_delete"
        rm -r $file_delete
    fi
