#!/bin/bash

# check dependencies
(
    type docker &>/dev/null || ( echo "docker is not available"; exit 1 )
)>&2


VERSION_SMSAD=5.1.8
VERSION_SMSA=5.1.8
VERSION_BOM=5.1.10
IMG=spring-mvc-start-archetype-docker
REPO=diside

docker build --build-arg="VERSION=$VERSION_SMSA" --build-arg="VERSION_BOM=$VERSION_BOM" --tag="$REPO/$IMG:$VERSION_SMSAD" .

docker push $REPO/$IMG:$VERSION_SMSAD
