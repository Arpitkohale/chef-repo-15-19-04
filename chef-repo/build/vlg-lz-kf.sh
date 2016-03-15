#!/bin/bash

#EUIR prd
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzkfprd01 --fqdn euirlzkfprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-kf]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=euirlzkfprd01,Environment=Production,Application=Kafka




