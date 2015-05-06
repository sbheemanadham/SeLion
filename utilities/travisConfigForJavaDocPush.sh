#!/bin/bash
#Generate the javadocs only if the following conditions are satisfied
#TRAVIS_REPO_SLUG - only run the script on the original project, not on the fork
#TRAVIS_JDK_VERSION - Use oraclejdk7 to generate javadocs
#TRAVIS_PULL_REQUEST - Check the build is not against a pull request
#TRAVIS_BRANCH - Check the build is against 'develop' branch
if [ "$TRAVIS_REPO_SLUG" = "sbheemanadham/SeLion" ] && [ "$TRAVIS_JDK_VERSION" = "oraclejdk7" ] && [ "$TRAVIS_PULL_REQUEST" = "false" ] && [ "$TRAVIS_BRANCH" = "develop" ]; then
	echo -e "Publishing javadocs...\n"
	cd $HOME
	#update user email and name in git config
	git config --global user.email "travis@travis-ci.org"
	git config --global user.name "travis-ci"
	# clone the project using TOKEN
	git clone --quiet https://${GH_TOKEN}@github.com/sbheemanadham/SeLion > /dev/null
	cd SeLion
	sh utilities/push-javadoc-to-gh-pages.sh
	echo -e "Published Javadoc to gh-pages branch.\n"
else
	echo -e "Failed to publish Javadocs to gh-pages branch as one or more validations against Travis environment variables failed.\n"
fi