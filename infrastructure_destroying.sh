#!/bin/bash

terraform -chdir=dev/ec2 destroy -auto-approve
terraform -chdir=dev/key_pair destroy -auto-approve
terraform -chdir=dev/ec2_security_groups destroy -auto-approve
terraform -chdir=dev/subnet destroy -auto-approve
terraform -chdir=dev/vpc destroy -auto-approve
