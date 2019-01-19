#!/bin/bash

# check dependencies
(
    type docker &>/dev/null || ( echo "docker is not available"; exit 1 )
)>&2


VERSION_SMSAD=5.1.2
IMG=spring-mvc-start-archetype-docker
REPO=diside

docker run -it --rm -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven $REPO/$IMG:$VERSION_SMSAD \
      mvn archetype:generate \
      -DarchetypeGroupId=com.github.dilbertside \
      -DarchetypeArtifactId=spring-mvc-start-archetype\
      -DarchetypeVersion=$VERSION_SMSAD
