#!/bin/bash

# check dependencies
(
    type docker &>/dev/null || ( echo "docker is not available"; exit 1 )
)>&2

if [ -f "pom.xml" ]
then
  echo "One POM exists in current directory $(pwd), generation will fail with error InvalidPackaging: Unable to add module to the current project as it is not of packaging type 'pom'"
  exit 1
fi

VERSION_SMSA=5.1.4
REPO=diside
IMG=spring-mvc-start-archetype-docker
VERSION_SMSAD=latest

docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven $REPO/$IMG:$VERSION_SMSAD \
      mvn archetype:generate \
      -DarchetypeGroupId=com.github.dilbertside \
      -DarchetypeArtifactId=spring-mvc-start-archetype\
      -DarchetypeVersion=$VERSION_SMSA
