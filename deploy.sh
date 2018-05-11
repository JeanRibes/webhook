#!/bin/bash
echo "fetching latest commits"
cd /repo
git fetch --all
git reset --hard origin/master
