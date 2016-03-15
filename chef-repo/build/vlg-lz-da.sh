#!/bin/bash

#USVA prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 140 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzdaprd20 --fqdn usvalzdaprd20.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-da]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret

#EUIR prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 140 -I ami-a10897d6 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N euirlzdaprd03 --fqdn euirlzdaprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-da]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret

#APSG prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 140 -I ami-68d8e93a --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N apsglzdaprd03 --fqdn apsglzdaprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-da]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret