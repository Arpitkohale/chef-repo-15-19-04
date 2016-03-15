#!/bin/bash

# prd
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m2.4xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaludbprd01 --fqdn usvaludbprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-db] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvaludbprd01,Environment=Production,Application=DB --server-connect-attribute private_ip_address

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaludbsbx01 --fqdn usvaludbsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-db] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvaludbsbx01,Environment=Sandbox,Application=DB --server-connect-attribute private_ip_address

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaludbstg01 --fqdn usvaludbstg01.inf.videologygroup.com --run-list role[vlg-base],role['vlg-lu-db'] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvaludbstg01,Environment=Staging,Application=DB --server-connect-attribute private_ip_address

# ete
knife ec2 server create -I ami-0f4cfd64 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f m2.4xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaludbete01 --fqdn usvaludbete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-db] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvaludbete01,Environment=EndToEnd,Application=DB --server-connect-attribute private_ip_address --ebs-size 256
