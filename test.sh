#!/bin/sh

set -x

echo "test file"
echo "WORKSPACE: $WORKSPACE"
if [ "$WORKSPACE" != "" ]
then
    echo "inside if"
fi

previous_leak=0
lines=`cat leaksummary.csv | wc -l`
if [ "$lines" -gt "2" ]
then
    echo "fetching leak value from previous run"
    previous_leak=`tail -1 leaksummary.csv | cut -d, -f2`
    echo $previous_leak
fi

leak=3600
echo "`date +%D`","$leak" >> leaksummary.csv
cp leaksummary.csv /tmp

if [ -f "./leak_alert" ]
then
    rm -f ./leak_alert
fi
leak_diff=`expr $leak - $previous_leak`
if [ "$leak_diff" -gt "500" ]
then
    touch ./leak_alert
fi

