#!/bin/bash

terraform -chdir=dev/ec2_security_groups destroy -auto-approve
terraform -chdir=dev/subnet destroy -auto-approve
terraform -chdir=dev/vpc destroy -auto-approve
