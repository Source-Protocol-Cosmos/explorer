#!/bin/bash
export ABSOLUTE_PATH=$(pwd)
echo "building image. Path: $ABSOLUTE_PATH"
sudo docker build -f "$ABSOLUTE_PATH/Dockerfile" -t explorer_img "$ABSOLUTE_PATH"
export CERTS_ABSOLUTE_PATH="$ABSOLUTE_PATH/nginx/certs"
echo "certs folder: $CERTS_ABSOLUTE_PATH"
if [ ! -d $CERTS_ABSOLUTE_PATH ] 
then
    echo "Error: Couldn't find the ssl certificates"
    exit 9999 # die with error code 9999
fi
echo "Starting explorer's docker container"
sudo docker run -v $CERTS_ABSOLUTE_PATH:/etc/certs -p 443:443 -d node_img
unset CERTS_ABSOLUTE_PATH