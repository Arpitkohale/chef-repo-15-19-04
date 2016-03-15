#!/bin/bash

# sbx
knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-04a4b260 --subnet subnet-4fcea716 --ssh-key gio-keypair -f m4.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaadlisbx01 --fqdn usvaadlisbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-ad-li] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=AppDev,Owner=Systems,Name=usvaadlisbx01,Environment=Sandbox,Application="Linear Indexing" --ebs-size 64

# prd
knife ec2 server create -I ami-0d4cfd66 --bootstrap-version 11.16.4 --security-group-ids sg-04a4b260 --subnet subnet-4fcea716 --ssh-key gio-keypair -f m4.4xlarge --ssh-user ec2-user --identity-file C:/Videology/keypairs/gio-keypair.pem -N usvaadtvprd01 --fqdn usvaadtvprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-ad-tv] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=AppDev,Owner=AppDev,Name=usvaadtvprd01,Environment=Production,Application="TV" --server-connect-attribute private_ip_address --ebs-size 256