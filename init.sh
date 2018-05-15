#!/bin/bash
if [ -d "/repo" ]; then
	echo "OK"
	if [ ! -d "/repo/.git" ]; then
		echo "Cloning $GITHUB_REPO on branch $BRANCH"
		cd /repo
		git init
		git remote add origin $GITHUB_REPO
		git pull origin master
		git branch --set-upstream-to=origin/master master
		git branch --set-upstream-to=origin/$BRANCH $BRANCH
		git checkout $BRANCH
		ls
		echo "OK, launching webhook listener"
	else
		echo "not cloning repo, just updating"
		cd /repo
		git pull
	fi
	/webhook -t $TOKEN --port 80 -c /deploy.sh
else
	echo "Need a volume mounted on /repo"
fi
