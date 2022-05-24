#!/bin/bash

rm -rf redis-stack-website
repo_dir=$(pwd)
git clone --recurse-submodules https://$PRIVATE_ACCESS_TOKEN@github.com/redis-stack/redis-stack-website
cd redis-stack-website
pip3 install -r requirements.txt
npm install autoprefixer
REDIS_STACK_DOCS_DIR=$repo_dir make netlify
