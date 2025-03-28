#!/bin/bash

# for easy testing, we can make this script separate


TEMP_DIR_GIT=$1
EXCHANGE_NAME=$2

echo "Generating exchange repository for $EXCHANGE_NAME in $TEMP_DIR_GIT"

# just for caution (to avoid accidental mistake) TEMP_DIR_GIT should contain either `tmp` or `temp` in its name
if [[ $TEMP_DIR_GIT != *"tmp"* ]] && [[ $TEMP_DIR_GIT != *"temp"* ]]; then
    echo "Error: TEMP_DIR_GIT should contain either 'tmp' or 'temp' in its name"
    exit 1
fi

rm -rf $TEMP_DIR_GIT/*
rsync -av --info=progress2 --info=name0 --exclude='.git/' --exclude='./tmp*' ./../../ $TEMP_DIR_GIT
echo $EXCHANGE_NAME > $TEMP_DIR_GIT/exchange_name
rm -r $TEMP_DIR_GIT/.vscode/
rm -f $TEMP_DIR_GIT/vsc-workspace.code-workspace
rm -f $TEMP_DIR_GIT/README.md
rm -f $TEMP_DIR_GIT/.github/scripts/*
rm -f $TEMP_DIR_GIT/.github/workflows/*
cp -f ./../workflows/build-single-exchange.yml $TEMP_DIR_GIT/.github/workflows/
