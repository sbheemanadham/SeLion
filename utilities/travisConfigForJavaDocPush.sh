#!/bin/bash
if [ "$TRAVIS_REPO_SLUG" = "sbheemanadham/SeLion" ] && [ "$TRAVIS_JDK_VERSION" = "oraclejdk7" ] && [ "$TRAVIS_PULL_REQUEST" = "false" ] && [ "$TRAVIS_BRANCH" = "develop" ]; then
	echo -e "Publishing javadoc...\n"
	cd $HOME
	git config --global user.email "travis@travis-ci.org"
	git config --global user.name "travis-ci"
	git clone --quiet https://${GH_TOKEN}@github.com/sbheemanadham/SeLion > /dev/null
	cd SeLion
	sh utilities/push-javadoc-to-gh-pages.sh
	echo -e "Published Javadoc to gh-pages branch.\n"
else
	echo -e "Failed to publish Javadocs to gh-pages branch.\n"
fi