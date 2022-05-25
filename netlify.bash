#!/bin/bash
# Prepares the Netlify preview
: ${REDIS_STACK_REPOSITORY:="github.com/redis-stack/redis-stack-website"}
if [[ -n $PRIVATE_ACCESS_TOKEN ]]; then
    REDIS_STACK_REPOSITORY="$PRIVATE_ACCESS_TOKEN@$REDIS_STACK_REPOSITORY"
fi
repo_dir=$(pwd)

cd /tmp
rm -rf stack
git clone --recurse-submodules -o stack https://$REDIS_STACK_REPOSITORY
REPO_DIR=$repo_dir REPOSITORY_URL=$REPOSITORY_URL PREVIEW_MODE=1 make deps netlify
