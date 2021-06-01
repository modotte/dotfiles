#!/bin/sh

if [ -z "$1" ];then
    CONTAINER_NAME="my_container"
else
    CONTAINER_NAME="$1"
fi

if [ -z "$(command -v docker)" ];then
    printf "[ERROR] docker tool is not found in PATH!\n" >&2
    exit 1
fi

if [ ! -f "Dockerfile" ];then
    printf "[ERROR] Dockerfile is not found!\n" >&2
    exit 1
fi

# Check if docker daemon is running.
if [ "$(systemctl is-active docker)" != "active" ];then
    printf "[INFO] Docker's daemon is not running. Activating..\n"
    systemctl start docker
fi

printf "[INFO] Building and running docker container: %s\n" "$CONTAINER_NAME"
docker build -t "$CONTAINER_NAME" . && docker run -it "$CONTAINER_NAME" bash

exit
