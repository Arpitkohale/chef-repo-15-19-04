#!/bin/bash

#USOR
#EBS-HVM-Amazon-Linux
#us-west-2a
knife ec2 server create --ebs-size 50 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-cfa94faa,sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzcbprd10 --fqdn usorlzcbprd10.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
#us-west-2b
knife ec2 server create --ebs-size 50 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-cfa94faa,sg-a76c85c2 --subnet subnet-d43233a0 --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzcbprd11 --fqdn usorlzcbprd11.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase

#USVA
#EBS-HVM-Amazon-Linux
#us-east-1e
knife ec2 server create --ebs-size 50 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-8cae46e9,sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzcbprd10 --fqdn usvalzcbprd10.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
#us-east-1b
knife ec2 server create --ebs-size 50 -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-8cae46e9,sg-46c73923 --subnet subnet-d2e4d2a6 --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usvalzcbprd11 --fqdn usvalzcbprd11.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase

#EUIR
#EBS-HVM-ami
knife ec2 server create -I ami-ae882bd9 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzcbprd01 --fqdn euirlzcbprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
knife ec2 server create -I ami-ae882bd9 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzcbprd02 --fqdn euirlzcbprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
#APSG
#EBS, HVM-ami
knife ec2 server create -I ami-e2ba9db0 --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzcbprd01 --fqdn apsglzcbprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
knife ec2 server create -I ami-e2ba9db0 --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f r3.2xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzcbprd02 --fqdn apsglzcbprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cb-r32x]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=Couchbase
