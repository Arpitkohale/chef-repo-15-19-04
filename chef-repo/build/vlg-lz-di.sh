#!/bin/bash

#USVA prd
knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzdiprd01 --fqdn usvalzdiprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-di]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application="Data Ingest"

#EUIR prd
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzdiprd03 --fqdn euirlzdiprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-di]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application="Data Ingest"
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 60 -I --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N euirlzdiprd04 --fqdn euirlzdiprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-di]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application="Data Ingest"

#APSG prd
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzdiprd03 --fqdn apsglzdiprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-di]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application="Data Ingest"
#Amazon linux, c4., EBS
knife ec2 server create --ebs-size 60 -I ami-68d8e93a --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N apsglzdiprd04 --fqdn apsglzdiprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-di]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application="Data Ingest"

