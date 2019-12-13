#!/bin/bash
sudo xhost +
sudo docker run --privileged --net=host -it -d -e DISPLAY --ipc host -v /dev/shm:/dev/shm -v /tmp/.X11-unix -v ~/projects:/home/dev/projects --shm-size 1G ventureum/dev:hehe bash


