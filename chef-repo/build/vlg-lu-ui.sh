#!/bin/bash

# prd
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2a46e64f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaluuiprd01 --fqdn usvaluuiprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-ui] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvaluuiprd01,Environment=Production,Application=UI

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaluuisbx01 --fqdn usvaluuisbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-ui] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvaluuisbx01,Environment=Sandbox,Application=UI

# stg
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaluuistg01 --fqdn usvaluuistg01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-ui] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvaluuistg01,Environment=Staging,Application=UI

# ete
knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaluuiete01 --fqdn usvaluuiete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-ui] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvaluuiete01,Environment=EndToEnd,Application=UI --server-connect-attribute private_ip_address
