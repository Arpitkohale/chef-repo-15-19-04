#!/bin/bash

# usva
knife ec2 server create -I ami-28cae740 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-05b8dd61 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalupxprd01 --fqdn usvalupxprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalupxprd01,Environment=Production,Application=Proxy

# usor
knife ec2 server create -I ami-9f527eaf --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2,sg-b5ae9cd0 --subnet subnet-7da4b81f --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usorlupxprd01 --fqdn usorlupxprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usorlupxprd01,Environment=Production,Application=Proxy

# euir
knife ec2 server create -I ami-c90897be --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-15bcc770 --subnet subnet-a79280c5 --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N euirlupxprd01 --fqdn euirlupxprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=euirlupxprd01,Environment=Production,Application=Proxy

# apsg
knife ec2 server create -I ami-32d8e960 --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-6d05ac08 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N apsglupxprd01 --fqdn apsglupxprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=apsglupxprd01,Environment=Production,Application=Proxy

# sbx
knife ec2 server create -I ami-1ccae774 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-91a661f5 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f t1.micro --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalupxsbx01 --fqdn usvalupxsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalupxsbx01,Environment=Sandbox,Application=Proxy

# stg
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.medium --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalupxstg01 --fqdn usvalupxstg01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalupxstg01,Environment=Staging,Application=Proxy

# ete
knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f c1.medium --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalupxete01 --fqdn usvalupxete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-px] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalupxete01,Environment=EndToEnd,Application=Proxy --server-connect-attribute private_ip_address
