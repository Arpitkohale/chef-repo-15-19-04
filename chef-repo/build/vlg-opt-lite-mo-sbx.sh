#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m3.large --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaolmosbx01 --fqdn usvaolmosbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-opt-lite-mo] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Optimization,Owner=Systems,Name=usvaolmosbx01,Environment=Sandbox,Application=OptLite,Component=MO
