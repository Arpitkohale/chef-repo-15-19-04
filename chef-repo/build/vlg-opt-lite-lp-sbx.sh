#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.2xlarge --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaollpsbx01 --fqdn usvaollpsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-opt-lite-lp] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Optimization,Owner=Systems,Name=usvaollpsbx01,Environment=Sandbox,Application=OptLite,Component=LP
