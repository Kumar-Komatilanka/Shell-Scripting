#!/bin/bash

echo "all variables passed to script: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "current dir: $PWD"
echo "Users running script: $USER"
echo "Users home directory: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"