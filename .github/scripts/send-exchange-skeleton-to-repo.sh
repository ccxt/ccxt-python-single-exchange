#!/bin/bash

# Get arguments
EXCHANGE_NAME=$1
COMMIT_MSG=$2

# Clone and push to the repo
TEMP_DIR=$(mktemp -d)
TEMP_DIR_GIT="$TEMP_DIR/$EXCHANGE_NAME-python"
echo "Cloning $EXCHANGE_NAME-python repository into $TEMP_DIR_GIT"
git clone https://x-access-token:$GITHUB_API_TOKEN@github.com/ccxt/$EXCHANGE_NAME-python.git $TEMP_DIR_GIT
# at first, clean th directory (except .git directory) and copy all files
echo "Clone finished"

chmod +x generate-exchange-skeleton.sh
./generate-exchange-skeleton.sh $TEMP_DIR_GIT $EXCHANGE_NAME

cd $TEMP_DIR_GIT
git config user.name github-actions
git config user.email github-actions@github.com
git add .
(git commit -m "$COMMIT_MSG" && git push origin main --force) || echo "No changes to commit"




# another way:
#
#
#     git config user.name github-actions
#     git config user.email github-actions@github.com
#     git remote add prod https://x-access-token:${{ secrets.API_TOKEN_FOR_CCXT_SINGLE_EXCHANGES }}@github.com/ccxt/python-${{ inputs.exchange_name }}.git
#     git config pull.rebase false
#     git fetch --unshallow origin
#     git pull --allow-unrelated-histories prod main || echo "Git pull failed"
#     git push prod main --force
