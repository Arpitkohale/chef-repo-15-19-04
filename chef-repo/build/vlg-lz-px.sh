#!/bin/bash

#USOR prd
# us-west-2a
knife ec2 server create --ebs-size 40 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzpdprd03 --fqdn usorlzpdprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy
# us-west-2b
knife ec2 server create --ebs-size 40 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-d43233a0 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzpdprd04 --fqdn usorlzpdprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy

#USVA prd
# us-east-1e
knife ec2 server create --ebs-size 40 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzpdprd03 --fqdn usvalzpdprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy
# us-east-1b
knife ec2 server create --ebs-size 40 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-d2e4d2a6 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzpdprd04 --fqdn usvalzpdprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pd]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy


#USVA stg
knife ec2 server create --ebs-size 40 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzpcstg01 --fqdn usvalzpcstg01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-pc]" --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Staging,Application=Proxy

#EUIR prd
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzdaprd01 --fqdn euirlzpxprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-px-da]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret

#APSG prd
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzpxprd01 --fqdn apsglzpxprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-px-da]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzpxprd02 --fqdn apsglzpxprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-px-se]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Proxy


