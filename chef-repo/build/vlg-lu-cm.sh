#!/bin/bash

# prd
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalucmprd01 --fqdn usvalucmprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-cm] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalucmprd01,Environment=Production,Application="Campaign Manager"

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalucmsbx01 --fqdn usvalucmsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-cm] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalucmsbx01,Environment=Sandbox,Application="Campaign Manager"

# stg
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalucmstg01 --fqdn usvalucmstg01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-cm] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalucmstg01,Environment=Staging,Application="Campaign Manager"

# ete
knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalucmete01 --fqdn usvalucmete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-cm] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalucmete01,Environment=EndToEnd,Application="Campaign Manager" --server-connect-attribute private_ip_address
