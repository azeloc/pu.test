#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "fptcorrea@gmail.com"
git config --global user.name "azeloc"

git clone -b content https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git output
cd output
git add --all *
git commit -m "Update the rep" || true
git push origin content
