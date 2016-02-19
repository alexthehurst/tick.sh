#!/bin/bash

if [[ $# > 0 ]]; then
    for (( a=1; a <=$1; a++ ))
    do tick.sh ${*:2} \[$a/$1\]
    done
else
    echo "Usage: review.sh iterations [time] [taskname]"
fi
