#!/bin/bash
# usage: create_aws_instance.sh INSTANCE_NAME

AWS_AMI=ami-d3b804bc
AWS_VPC=vpc-993aeff0

docker-machine create --driver amazonec2 \
                      --amazonec2-ami $AWS_AMI \
                      --amazonec2-region eu-central-1 \
                      --amazonec2-instance-type c4.2xlarge \
                      --amazonec2-security-group default \
		      --amazonec2-vpc-id $AWS_VPC \
                      --amazonec2-root-size 32 \
                      --amazonec2-request-spot-instance \
                      --amazonec2-spot-price "1.5" \
                      --amazonec2-zone a \
		      $1

