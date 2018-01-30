#!/bin/bash
# Usage: First use nvidia-docker to launch a container (can be removed, but keep volume)
# then run this file
set -e

TAGFILE=${1:-imagetag_cpu.txt}
IMAGE_TAG=$(cat $TAGFILE)

EFS_VOLUME_R3PI=fs-6223c33b

docker run -it \
           -v $(docker volume create --driver=efs --name=$EFS_VOLUME_R3PI):/home/tf/efs \
	   -p 8880:8880 \
           --name r3pi_cpu \
           $IMAGE_TAG \
	   /bin/bash
