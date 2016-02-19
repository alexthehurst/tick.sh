#!/bin/bash

# In seconds:
DEFAULT_TIMER=120

function log(){
    stamp=`date -Iminutes`
    echo ""
    echo "Completed task '$TASK'."
    read -p "Optional note (or 'del'): " note
    if [[ "$note" = 'del' ]]; then
        echo "Recording nothing for task: $TASK"
    else
        echo "$stamp,$GOAL_SECS,$TOTALTIME,\"$TASK\",\"$note\"" >> ~/ticklog.csv
    fi

    exit 0
}

function fmt () { `expr $1 / 60`m`expr $1 % 60`s; }

trap 'log' INT


function test(){
    echo "All done!"
    exit 0
}


# Count down

if [[ ${1:0:1} == [0-9]  ]]; then
    timestr=$1
    case ${timestr:0-1} in
        [0-9])
            GOAL_SECS=$timestr
            ;;
        's')
            timelength=`expr ${#timestr} - 1`
            GOAL_SECS=`expr ${timestr:0:$timelength}`
            ;;
        'm')
            timelength=`expr ${#timestr} - 1`
            GOAL_SECS=`expr ${timestr:0:$timelength} \* 60`
            ;;
        'h')
            timelength=`expr ${#timestr} - 1`
            GOAL_SECS=`expr ${timestr:0:$timelength} \* 3600`
            ;;
    esac
    if [[ $# > 1 ]]; then
        TASK="${*:2}"
    fi
else
    if [[ $# -gt 0 ]]; then
        TASK="${*:1}"
    fi
    GOAL_SECS=$DEFAULT_TIMER
fi
SECS=$GOAL_SECS
TOTALTIME=0

echo "Commencing: $TASK"

while [[ 0 -ne $SECS ]]; do
    if [[ $SECS -gt 20 ]]; then
        if [[ `expr $SECS % 10` -eq 0 ]]; then
            echo `expr $SECS / 60`m`expr $SECS % 60`s...
        fi
    else
        echo "$SECS..."
    fi
    sleep 1
    SECS=$[$SECS-1]
    TOTALTIME=$[$TOTALTIME+1]
done

# open -a Terminal
# open -a iTerm

osascript -e "display notification \"Out of time on task: $TASK.\""
echo "Time is up!"

while [[ 1 == 1 ]]; do
    SECS=$[$SECS+1]
    TOTALTIME=$[$TOTALTIME+1]
    nicesecs=`expr $SECS / 60`m`expr $SECS % 60`s
    nicetotaltime=`expr $TOTALTIME / 60`m`expr $TOTALTIME % 60`s
    if [[ $SECS -gt 20 ]]; then
        if [[ `expr $SECS % 10` -eq 0 ]]; then
            echo "$nicesecs over ($nicetotaltime total)."
        fi
    else
        echo "$nicesecs over ($nicetotaltime total)."
    fi
    if [[ "`expr $SECS % 60`" == 0 ]]; then
        osascript -e "display notification \"Over time by `expr $SECS / 60` on task: $TASK.\""
    fi
    sleep 1
done
