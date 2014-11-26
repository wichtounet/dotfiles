#!/bin/sh

stat=`cmus-remote -Q 2>/dev/null`

if [[ $stat != *duration* ]]
then
    echo "0"
else
    echo "(`cmus-remote -Q 2>/dev/null | /usr/bin/zgrep 'position ' | cut -c 10-` / `cmus-remote -Q 2>/dev/null | /usr/bin/zgrep 'duration ' | cut -c 10-`)*100.0" | bc -l | cut -d . -f 1
fi