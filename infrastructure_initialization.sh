#!/bin/bash

terraform -chdir=dev/vpc init
terraform -chdir=dev/vpc apply -auto-approve

terraform -chdir=dev/subnet init
terraform -chdir=dev/subnet apply -auto-approve

terraform -chdir=dev/security_groups/ec2_security_groups init
terraform -chdir=dev/security_groups/ec2_security_groups apply -auto-approve

terraform -chdir=dev/key_pair init
terraform -chdir=dev/key_pair apply -auto-approve

terraform -chdir=dev/ec2 init
terraform -chdir=dev/ec2 apply -auto-approve

terraform -chdir=dev/security_groups/mysql_security_group init
terraform -chdir=dev/security_groups/mysql_security_group apply -auto-approve

terraform -chdir=dev/databases/mysql_rds init
terraform -chdir=dev/databases/mysql_rds apply -auto-approve

#Install elasticache redis
terraform -chdir=dev/security_groups/elasticache_redis_security_group init
terraform -chdir=dev/security_groups/elasticache_redis_security_group apply -auto-approve

terraform -chdir=dev/databases/elasticache_redis init
terraform -chdir=dev/databases/elasticache_redis apply -auto-approve