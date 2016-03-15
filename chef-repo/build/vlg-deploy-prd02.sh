#!/bin/bash

knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvadeployprd02 --fqdn usvadeployprd02.inf.videologygroup.com --run-list role[vlg-base],role[vlg-deploy] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvadeployprd02,Environment=Production,Application=Deploy
