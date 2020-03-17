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
ACCESS_TOKEN=$3
COMMENT=$4

echo "PR number: $PR_NUMBER"
echo "Repo: $REPO"
echo "Access token: $ACCESS_TOKEN"
echo "Comment: $COMMENT"

PAYLOAD="{\"body\":\"$COMMENT\"}"
PR_URL="https://api.github.com/repos/$REPO/issues/$PR_NUMBER/comments"

curl -s -H "Authorization: token $ACCESS_TOKEN" -X POST -d $PAYLOAD $PR_URL