#!/bin/bash
rm -rf redis-stack-website
repo_dir=$(pwd)
git clone --recurse-submodules https://$PRIVATE_ACCESS_TOKEN@github.com/redis-stack/redis-stack-website
cd redis-stack-website
pip3 install -r requirements.txt
npm install autoprefixer
REPO_DIR=$repo_dir REPOSITORY_URL=$REPOSITORY_URL PREVIEW_MODE=1 make netlify
