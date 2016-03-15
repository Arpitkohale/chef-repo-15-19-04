#!/bin/bash

knife ec2 server create -I ami-094cfd62 --bootstrap-version 11.16.4 --security-group-ids sg-fcfb5199 --subnet subnet-a0f3af88 --associate-public-ip --ssh-key gio-keypair -f m1.small --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvadeploysbx01 --fqdn usvadeploysbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-deploy] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvadeploysbx01,Environment=Sandbox,Application=Deploy
