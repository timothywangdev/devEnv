#!/bin/bash

sudo docker run --gpus all -itd --ipc=host -v /mnt/6da521ae-93b2-44d6-bd41-422c135def79/projects:/workspace/projects nvcr.io/nvidia/pytorch:19.09-py3

