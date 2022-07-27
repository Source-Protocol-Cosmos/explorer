#!/bin/bash
export ABSOLUTE_PATH=$(pwd)

if ! yarn install
then 
    echo "Failed when installing dependencies"
    exit 9999
fi
if ! yarn build 
then
    echo "Failed when building production app"
    exit 9998
fi
echo "building image. Path: $ABSOLUTE_PATH"
if ! sudo docker build -f "$ABSOLUTE_PATH/Dockerfile" -t explorer_img "$ABSOLUTE_PATH"
then
    echo "Error: Couldn't build image"
    exit 9997 # die with error code 
fi
export CERTS_ABSOLUTE_PATH="$ABSOLUTE_PATH/nginx/certs"
echo "certs folder: $CERTS_ABSOLUTE_PATH"
if [ ! -d $CERTS_ABSOLUTE_PATH ] 
then
    echo "Error: Couldn't find the ssl certificates"
    exit 9996 # die with error code 
fi
echo "Starting explorer's docker container"
sudo docker run -it -v $CERTS_ABSOLUTE_PATH:/etc/certs -p 443:443 -d explorer_img
unset CERTS_ABSOLUTE_PATH