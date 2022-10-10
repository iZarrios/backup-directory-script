#! /bin/bash

error_args(){
    echo "./backupd.sh DIR BACKUPDIR INTERVAL-SECS MAX-BACKUPS"
    exit 1
}

re="^[1-9]+$"

if [[ $# < 4 ]]
then
    error_args
else

    # dir=$(realpath $1)
    # backupdir=$(realpath $2)

    # echo $dir
    # echo $backupdir
    # exit 0
    if [[ $1 == "." ]]
    then
        dir=$(pwd)
    else
        dir=$1
    fi

    if [[ $2 == "." ]]
    then
        error_args
    else
        backupdir=$2
    fi

    if ! [[ $3 =~ $re ]] ; then
        echo "error: Not a number" 
        error_args
    else
        interval=$3
    fi

    if ! [[ $3 =~ $re ]] ; then
        echo "error: Not a number" 
        error_args
    else
        max_backups=$4
    fi
fi

# if [[ -d $backupdir ]] 
# then
#     echo "$(realpath $backupdir)...already exists"
#     exit 1
# else
#     mkdir $backupdir
# fi

cd $backupdir

ls -lr $dir > directory-info.last

date_fmt=$(date +"%Y-%m-%d-%H-%M-%S")

mkdir $date_fmt
cp -r $dir $date_fmt


while [[ true ]]
do
    sleep $interval
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
done
