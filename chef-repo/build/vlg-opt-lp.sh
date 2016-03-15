#!/bin/bash

knife ec2 server create -I ami-7ee75416 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaoplpprd02 --fqdn usvaoplpprd02.inf.videologygroup.com --run-list role[vlg-base],role[vlg-opt-lp] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Optimization,Owner=Systems,Name=usvaoplpprd02,Environment=Production,Application=LP
