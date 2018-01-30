#/bin/bash
# Usage: source initiate_container_cpu HOST_NAME

if [ $# -eq 0 ]
  then
    echo "You need to provide the machine name as argument"
    exit
fi

TAGFILE=${2:-imagetag_cpu.txt}
IMAGE_TAG=$(cat $TAGFILE)

source ../set_host_machine.sh $1
docker pull $IMAGE_TAG
docker tag $IMAGE_TAG r3pi/cartrain:cpu
docker run r3pi/cartrain:cpu/bin/bash
