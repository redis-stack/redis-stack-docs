#!/bin/bash
# Prepares the Netlify preview
: ${REDIS_STACK_REPOSITORY:="github.com/redis-stack/redis-stack-website"}
: ${TARGET_PATH:="/tmp/stack"}
if [[ -n $PRIVATE_ACCESS_TOKEN ]]; then
    REDIS_STACK_REPOSITORY="$PRIVATE_ACCESS_TOKEN@$REDIS_STACK_REPOSITORY"
fi
repo_dir=$(pwd)

rm -rf $TARGET_PATH
git clone --recurse-submodules https://$REDIS_STACK_REPOSITORY $TARGET_PATH
cd $TARGET_PATH
REPO_DIR=$repo_dir REPOSITORY_URL=$REPOSITORY_URL PREVIEW_MODE=1 make deps netlify
