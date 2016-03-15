#!/bin/bash

#EUIR prd
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzslprd01 --fqdn euirlzpslrd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sl]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=usvalzslprd01,Environment=Production,Application=Solr

#APSG prd
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzslprd02 --fqdn apsglzslprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sl]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=apsglzslprd02,Environment=Production,Application=Solr