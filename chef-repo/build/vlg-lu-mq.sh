#!/bin/bash

# apsg
knife ec2 server create -I ami-1cd8e94e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-ca1cbeaf --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f m1.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N apsglumqprd01 --fqdn apsglumqprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=apsglumqprd01,Environment=Production,Application=MQ

# euir
knife ec2 server create -I ami-cf0897b8 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-fab8cb9f --subnet subnet-af9429d8 --associate-public-ip --ssh-key gio-keypair -f m1.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N euirlumqprd01 --fqdn euirlumqprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=euirlumqprd01,Environment=Production,Application=MQ

# usor
knife ec2 server create -I ami-97527ea7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2,sg-77200f12 --subnet subnet-7da4b81f --associate-public-ip --ssh-key gio-keypair -f m1.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usorlumqprd01 --fqdn usorlumqprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usorlumqprd01,Environment=Production,Application=MQ

# usva
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-f9fb789d --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m1.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalumqprd01 --fqdn usvalumqprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalumqprd01,Environment=Production,Application=MQ

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalumqsbx01 --fqdn usvalumqsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalumqsbx01,Environment=Sandbox,Application=MQ

# stg
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalumqstg01 --fqdn usvalumqstg01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalumqstg01,Environment=Staging,Application=MQ

# ete
knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f m1.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalumqete01 --fqdn usvalumqete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-mq] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalumqete01,Environment=EndToEnd,Application=MQ --server-connect-attribute private_ip_address
