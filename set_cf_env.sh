#!/bin/sh
APP_NAME=$1

echo "preparing to set envvariables"

cf target -o $BLUEMIX_ORG -s $BLUEMIX_SPACE

cf set-env $APP_NAME CF_REPO_SLUG $TRAVIS_REPO_SLUG
cf set-env $APP_NAME CF_COMMIT $TRAVIS_COMMIT
cf set-env $APP_NAME CF_COMMIT_RANGE $TRAVIS_COMMIT_RANGE
