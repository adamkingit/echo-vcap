#!/bin/sh
APP_NAME=$1

echo "preparing to set envvariables"
echo "$TRAVIS_REPO_SLUG"
echo "$TRAVIS_COMMIT"
echo "$TRAVIS_COMMIT_RANGE"

echo "download and install cloudfoundry cli"
wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add -
echo "deb http://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
sudo apt-get -y update
sudo apt-get -y install cf-cli

cf login -a https://api.ng.bluemix.net -u $BLUEMIX_USER -p $BLUEMIX_PASSWORD -o BLUEMIX_ORG -s BLUEMIX_SPACE
cf set-env $APP_NAME CF_REPO_SLUG $TRAVIS_REPO_SLUG
cf set-env $APP_NAME CF_COMMIT $TRAVIS_COMMIT
cf set-env $APP_NAME CF_COMMIT_RANGE $TRAVIS_COMMIT_RANGE
