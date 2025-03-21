#!/bin/bash

# for easy testing, we can make this script separate
$TEMP_DIR_GIT=$1
$EXCHANGE_NAME=$2

rm -rf $TEMP_DIR_GIT/*
rsync -av --info=progress2 --info=name0 --exclude='.git/' --exclude='build/ccxt/' ./ $TEMP_DIR_GIT
rm -f $TEMP_DIR_GIT/.github/workflows/transfer-all.yml
rm -f $TEMP_DIR_GIT/.github/workflows/transfer-exchange.yml
rm -r $TEMP_DIR_GIT/.vscode/
rm -f $TEMP_DIR_GIT/vsc-workspace.code-workspace
rm -f $TEMP_DIR_GIT/README.md
echo $EXCHANGE_NAME > $TEMP_DIR_GIT/exchange_name