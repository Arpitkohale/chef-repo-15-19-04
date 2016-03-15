#!/bin/sh

#USVA prd
knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzzkprd01 --fqdn usvalzzkprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-zk]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=usvalzzkprd01,Environment=Production,Application=Zookeeper

#USOR prd
 knife ec2 server create --ebs-size 100 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzzkprd01 --fqdn usorlzzkprd01.inf.videologygroup.com --run-list "role[vlg-base]" --region=us-west-2  --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Zookeepr

#EUIR prd
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzzkprd01 --fqdn euirlzzkprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-zk]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=euirlzzkprd01,Environment=Production,Application=Zookeeper

#APSG prd
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzdaprd01 --fqdn apsglzzkprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-zk]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=euirlzzkprd01,Environment=Production,Application=Zookeeper