#!/bin/bash

# sbx
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalurhsbx01 --fqdn usvalurhsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-rh] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalurhsbx01,Environment=Sandbox,Application="Request Handler"

# stg
knife ec2 server create -I ami-5ccae734 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-2bbd6f4f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalurhstg01 --fqdn usvalurhstg01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-rh] --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Systems,Name=usvalurhstg01,Environment=Staging,Application="Request Handler"

# ete
knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f c1.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvalurhete01 --fqdn usvalurhete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-rh] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvalurhete01,Environment=EndToEnd,Application="Request Handler" --server-connect-attribute private_ip_address
