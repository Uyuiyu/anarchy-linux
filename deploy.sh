#!/usr/bin/env bash

if [["`git status-s`"]]; then
	echo "The working directory is dirty. Please commit any pending changes."
	exit 1;
fi

if [[ -d ./public ]]; then
    echo "Deleting old publication (public folder)"
    rm -rf public
fi

mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out gh-pages branch into public"
git worktree add -B gh-pages public upstream/gh-pages

echo "Removing existing files"
rm -rf public/*

echo "Generating site"
hugo

echo "Commiting to gh-pages branch"
cd public && git add --all && git commit -m "Publish to gh-pages (deploy.sh)"

echo "Pushing to gh-pages branch"
git push upstream gh-pages

echo "Cleaning up"
rm -rf public/
rm -rf resources/
git worktree prune
rm -rf .git/worktrees/public/

echo "Done, exiting."
