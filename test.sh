#!/bin/sh

echo "test file"
echo "WORKSPACE: $WORKSPACE"
if [ "$WORKSPACE" != "" ]
then
    echo "inside if"
fi
