#!/bin/bash
echo "fetching latest commits from $GITHUB_REPO on branch $BRANCH"
cd /repo
git fetch --all
git reset --hard origin/$BRANCH
git checkout $BRANCH
