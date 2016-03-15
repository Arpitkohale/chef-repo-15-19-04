#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-d2e4d2a6 --associate-public-ip --ssh-key gio-keypair -f m3.large --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaolcmprd02 --fqdn usvaolcmprd02.inf.videologygroup.com --run-list role[vlg-base],role[vlg-opt-lite-cm] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Optimization,Owner=Systems,Name=usvaolcmprd02,Environment=Production,Application=OptLite,Component=CM
