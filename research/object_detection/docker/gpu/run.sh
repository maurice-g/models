#!/bin/bash
# Usage: First use nvidia-docker to launch a container (can be removed, but keep volume)
# then run this file
set -e

TAGFILE=${1:-imagetag_gpu.txt}
IMAGE_TAG=$(cat $TAGFILE)

EFS_VOLUME_R3PI=fs-6223c33b
NVIDIA_DRIVER=nvidia_driver_396.26

docker volume inspect $NVIDIA_DRIVER > /dev/null
docker run -it \
           -v $(docker volume create --driver=efs --name=$EFS_VOLUME_R3PI):/home/tf/efs \
           -v $NVIDIA_DRIVER:/usr/local/nvidia:ro --device=/dev/nvidia0 --device=/dev/nvidia-uvm --device=/dev/nvidiactl \
           --name r3pi_gpu \
           $IMAGE_TAG \
	   /bin/bash
