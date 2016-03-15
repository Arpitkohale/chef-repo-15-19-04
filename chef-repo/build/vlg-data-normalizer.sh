#!/bin/bash

# prd
knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-99c276fd,sg-2a46e64f --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvadtnlprd04 --fqdn usvadtnlprd04.inf.videologygroup.com --run-list role[vlg-base],role[vlg-data-normalizer] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Data,Owner=Systems,Name=usvadtnlprd04,Environment=Production,Application="Normalizer" --ebs-size 768

# ete
knife ec2 server create -I ami-1ccae774 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-c89d74ad --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvadtnlete01 --fqdn usvadtnlete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-data-normalizer] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Data,Owner=Systems,Name=usvadtnlete01,Environment=EndToEnd,Application="Normalizer" --ebs-size 128
