#!/bin/bash

VERSION_SMSAD=5.1.0
VERSION_BOM=555e40549d
IMG=spring-mvc-start-archetype-docker
REPO=diside

#docker build --build-arg="VERSION=$VERSION_SMSAD" --build-arg="VERSION_BOM=$VERSION_BOM" --tag="$REPO/$IMG:$VERSION_SMSAD" .

docker push $REPO/$IMG:$VERSION_SMSAD
