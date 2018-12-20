#!/bin/sh

echo "test file"
echo "WORKSPACE: $WORKSPACE"
if [ "$WORKSPACE" != "" ]
then
    echo "inside if"
fi

echo "`date +%D`","1100" >> leaksummary.csv
cp leaksummary.csv /tmp
