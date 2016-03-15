#!/bin/bash

#USVA stg, Amazon linux, c4., EBS
knife ec2 server create --ebs-size 30 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-fcfb5199 --subnet subnet-a0f3af88 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --identity-file ~/.ssh/gio-keypair.pem -N usvalzjbstg01 --fqdn usvalzjbstg01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-jb]" --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Staging,Application=Jobs

#USOR prd, Amazon linux, c4., EBS
knife ec2 server create --ebs-size 40 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.large --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzjbprd01 --fqdn usorlzjbprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-jb]" --region=us-west-2  --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Jobs