#!/bin/bash

#USVA prd 
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 30 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzpdprd01 --fqdn usvalzpdprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy

#USOR prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 30 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-cfa94faa,sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzpdprd01 --fqdn usorlzpdprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy

#EUIR prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 30 -I ami-a10897d6 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N euirlzpdprd01 --fqdn euirlzpdprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy

#APSG prd
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 30 -I ami-68d8e93a --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N apsglzpdprd01 --fqdn apsglzpdprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy
