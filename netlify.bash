#!/bin/bash

rm -rf redis-stack-website
git clone --recurse-submodules https://$PRIVATE_ACCESS_TOKEN@github.com/redis-stack/redis-stack-website
cd redis-stack-website

printenv

npm install autoprefixer
REDIS_STACK_DOCS_SHA=$COMMIT_REF REDIS_STACK_DOCS_REMOTE=$REPOSITORY_URL make netlify
