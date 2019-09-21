#!/bin/bash

sudo docker run --gpus all --ipc=host -it --rm -v /media/hehe/Ubuntu_data1/projects:/workspace/projects nvcr.io/nvidia/pytorch:19.09-py3

