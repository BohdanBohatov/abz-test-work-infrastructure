#!/bin/bash

terraform -chdir=dev/databases/elasticache_redis destroy -auto-approve
terraform -chdir=dev/databases/mysql_rds destroy -auto-approve
terraform -chdir=dev/ec2 destroy -auto-approve
terraform -chdir=dev/key_pair destroy -auto-approve

terraform -chdir=dev/security_groups/ec2_security_groups destroy -auto-approve
terraform -chdir=dev/security_groups/mysql_security_group destroy -auto-approve
terraform -chdir=dev/security_groups/elasticache_redis_security_group destroy -auto-approve

terraform -chdir=dev/subnet destroy -auto-approve
terraform -chdir=dev/vpc destroy -auto-approve
