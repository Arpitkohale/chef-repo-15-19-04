#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvarndsbx01 --fqdn usvarndsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rnd-sbx] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Rnd,Owner=Systems,Name=usvarndsbx01,Environment=Sandbox,Application=Rnd_GAP
