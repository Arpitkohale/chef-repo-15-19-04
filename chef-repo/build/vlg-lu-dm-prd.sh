#!/bin/bash

knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f m1.large --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvaludmprd01 --fqdn usvaludmprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-lu-dm] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Lucy,Owner=Lucy,Name=usvaludmprd01,Environment=Production,Application=Demo
