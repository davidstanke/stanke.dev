#!/usr/bin/env bash
set -eEou pipefail

# TODO: rewrite this script as a go(?) binary and provide proper parameter parsing

# parameters:
# $1: the number of the PR to post to
# $2: the repo (as org/repo) containing the PR
# $3: the GitHub access token for an account with PR comment permissions
# $4: text of the comment to post

PR_NUMBER=$1
REPO=$2
COMMENT=$3
ACCESS_TOKEN=$4


PAYLOAD="{\"body\":\"$COMMENT\"}"
PR_URL="https://api.github.com/repos/$REPO/issues/$PR_NUMBER/comments"

echo "posting $PAYLOAD to $PR_URL..."

curl -s -H "Authorization: token $ACCESS_TOKEN" -X POST -d "$PAYLOAD" $PR_URL