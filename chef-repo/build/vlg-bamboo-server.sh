#!/bin/bash

# sbx
knife ec2 server create -I ami-0f4cfd64 --bootstrap-version 11.16.4 --security-group-ids sg-04a4b260 --subnet subnet-4fcea716 --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvagibssbx01 --fqdn usvagibssbx01.inf.videologygroup.com --region=us-east-1 --environment sandbox --run-list role[vlg-base],role[vlg-bamboo-server] --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvagibssbx01,Environment=Sandbox,Application=Bamboo --ebs-size 64
