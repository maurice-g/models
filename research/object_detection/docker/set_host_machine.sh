#/bin/bash
# Usage: set_host_machine HOST_NAME

eval `docker-machine env $1`
export NV_HOST="ssh://ubuntu@$(docker-machine ip $1):"
ssh-add ~/.docker/machine/machines/$1/id_rsa


