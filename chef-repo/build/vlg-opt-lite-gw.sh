#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-858b24e0 --subnet subnet-d0556796 --associate-public-ip --ssh-key gio-keypair -f m3.large --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaolgwprd02 --fqdn usvaolgwprd02.inf.videologygroup.com --run-list role[vlg-base],role[vlg-opt-lite-gw] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Optimization,Owner=Systems,Name=usvaolgwprd02,Environment=Production,Application=Opt-Lite-GW
