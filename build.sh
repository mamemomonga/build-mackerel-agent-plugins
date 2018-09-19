#!/bin/bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APPNAME="mackerel-agent-plugins"
DCR_IMAGE="builder-$APPNAME"

docker build -t $DCR_IMAGE .

mkdir -p build
docker run -i --rm \
 	-e GOOS=linux \
 	-e GOARCH=arm \
	-v $BASEDIR/build:/opt/mackerel-agent-plugins/build \
	$DCR_IMAGE \
	sh -xec 'cd /opt/mackerel-agent-plugins && make build'

