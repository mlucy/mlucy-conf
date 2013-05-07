#!/bin/bash

b=~/.temp

if [[ ! -f $b ]]; then
    echo 6500 > $b
fi

if [[ "$1" == "" ]]; then
    :
elif [[ "$1" == "blue" || "$1" == "+" ]]; then
    echo $((`cat $b`+200)) > $b
elif [[ "$1" == "red" || "$1" == "-" ]]; then
    echo $((`cat $b`-200)) > $b
elif [[ "$1" == "normal" ]]; then
    echo 6500 > $b
else
    echo "unknown options" "$@" | tee ~/.temp_error
    exit 1
fi

redshift -o -l 0:0 -b 1.0 -m randr -t `cat $b`:`cat $b`
echo `cat $b`