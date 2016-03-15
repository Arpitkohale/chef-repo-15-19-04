#!/bin/bash

knife ec2 server create -I ami-3ce05354 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.2xlarge --ssh-user root --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvagrprd01 --fqdn usvagrprd01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-graphite] --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Systems,Owner=Systems,Name=usvagrprd01,Environment=Production,Application=Graphite
