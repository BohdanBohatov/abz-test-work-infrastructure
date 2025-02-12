#!/bin/bash

terraform -chdir=dev/vpc init
terraform -chdir=dev/vpc apply -auto-approve

terraform -chdir=dev/subnet init
terraform -chdir=dev/subnet apply -auto-approve

terraform -chdir=dev/ec2_security_groups init
terraform -chdir=dev/ec2_security_groups apply -auto-approve