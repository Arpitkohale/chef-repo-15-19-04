#!/bin/bash

# prd
knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-04ca9142 --associate-public-ip --ssh-key gio-keypair -f m3.2xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvagirdprd01 --fqdn usvagirdprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rundeck] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvagirdprd01,Environment=Production,Application=rundeck --ebs-size 256

# sbx
knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-04ca9142 --associate-public-ip --ssh-key gio-keypair -f m3.large --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvagirdsbx01 --fqdn usvagirdsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rundeck] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvagirdsbx01,Environment=Sandbox,Application=rundeck --ebs-size 32

# ete
knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-d77cdeb0 --subnet subnet-7e4b3d55 --ssh-key gio-keypair -f m3.xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvagirdete01 --fqdn usvagirdete01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rundeck] --region=us-east-1 --environment endtoend --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvagirdete01,Environment=EndToEnd,Application=rundeck --ebs-size 256
