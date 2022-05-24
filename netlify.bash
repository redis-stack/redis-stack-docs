#!/bin/bash

rm -rf redis-stack-website
cwd=$(pwd)
git clone --recurse-submodules https://$PRIVATE_ACCESS_TOKEN@github.com/slorello89/redis-stack-website
cd redis-stack-website
git checkout netlify-previews
npm install autoprefixer
REDIS_STACK_DOCS_DIR=$cwd make netlify
