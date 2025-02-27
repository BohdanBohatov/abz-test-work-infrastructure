module "ec2_instance" {
  source = "../../modules/ec2"

  instance_ami         = "ami-087a0156cb826e921"
  instance_type        = "t2.micro"
  env                  = "dev"
  subnet_id            = data.terraform_remote_state.subnets.outputs.public_subnet_1_id
  security_group       = data.terraform_remote_state.ec2_security_group.outputs.security_group_id
  key_name             = data.terraform_remote_state.key_pair.outputs.key_name
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  user_data            = <<EOF
#!/bin/bash
set -e

WORDPRESS_VERSION=${local.wordpress_version}

sudo touch /var/log/user_data.log
sudo echo "Start preconfiguring EC2" >> /var/log/user_data.log 

sudo echo "Install CodeDeploy Agent" >> /var/log/user_data.log
sudo yum update -y
sudo yum install ruby -y
wget https://aws-codedeploy-${local.region}.s3.${local.region}.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo systemctl start codedeploy-agent
sudo systemctl enable codedeploy-agent
sudo echo "Finished installing CodeDeploy agent" >> /var/log/user_data.log 

sudo echo "Install WordPress required software" >> /var/log/user_data.log 
sudo dnf install -y httpd php php-mysqlnd php-fpm php-json php-common php-mbstring php-xml php-gd php-devel php-curl mariadb105\
    php-cli php-devel php-pear php-json gcc make
sudo echo "FInished installing WordPress required software" >> /var/log/user_data.log

sudo echo "Install Redis" >> /var/log/user_data.log
sudo printf "no\n" | sudo pecl install redis-6.0.0
sudo echo "extension=redis.so" | sudo tee -a /etc/php.ini
sudo echo "Finished installing Redis" >> /var/log/user_data.log

sudo echo "Download and install WordPress" >> /var/log/user_data.log
cd /var/www/html
sudo wget https://wordpress.org/wordpress-$WORDPRESS_VERSION.tar.gz
sudo tar -xzf wordpress-$WORDPRESS_VERSION.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress wordpress-$WORDPRESS_VERSION.tar.gz
sudo echo "Finshed downloading and installing WordPress" >> /var/log/user_data.log

sudo echo "Download and install WP CLI" >> /var/log/user_data.log
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
sudo echo "Finished downloading and installing WP CLI" >> /var/log/user_data.log


sudo echo "Configure WordPress" >> /var/log/user_data.log
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl restart php-fpm
sudo systemctl enable php-fpm
sudo echo "Finished configuring WordPress" >> /var/log/user_data.log

sudo echo "Finish configuring EC2" >> /var/log/user_data.log
EOF

}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = data.terraform_remote_state.ec2_role.outputs.ec2_role_name
}
