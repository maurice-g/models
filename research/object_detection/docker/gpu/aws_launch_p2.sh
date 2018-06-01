#!/bin/bash
# usage: create_aws_instance.sh INSTANCE_NAME

AWS_AMI=ami-e68ebb0d
AWS_VPC=vpc-993aeff0

docker-machine create --driver amazonec2 \
                      --amazonec2-ami $AWS_AMI \
                      --amazonec2-region eu-central-1 \
                      --amazonec2-instance-type p2.xlarge \
                      --amazonec2-security-group default \
            	      --amazonec2-vpc-id $AWS_VPC \
                      --amazonec2-root-size 32 \
		      $1

