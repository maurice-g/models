#!/bin/bash
# usage: create_aws_instance.sh INSTANCE_NAME

AWS_AMI=ami-d3b804bc
AWS_VPC=vpc-993aeff0

docker-machine create --driver amazonec2 \
                      --amazonec2-ami $AWS_AMI \
                      --amazonec2-region eu-central-1 \
                      --amazonec2-instance-type p2.xlarge \
                      --amazonec2-security-group default \
		      --amazonec2-vpc-id $AWS_VPC \
                      --amazonec2-root-size 32 \
                      --amazonec2-request-spot-instance \
                      --amazonec2-spot-price "1.1" \
                      --amazonec2-zone b \
		      $1
