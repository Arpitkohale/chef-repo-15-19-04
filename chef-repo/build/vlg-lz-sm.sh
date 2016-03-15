#!/bin/bash

#USVA prd
#SM-NB-UI
knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzsmprd01 --fqdn usvalzsmprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-ui], role[vlg-lz-sm-nb]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Owner=Eliza,Name=usvalzsmprd01,Environment=Production,Application=Storm
#SM-SV
knife ec2 server create -I ami-1c5dd974 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923,sg-8cae46e9 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzsmprd01 --fqdn usvalzsmprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-sv]" --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Owner=Eliza,Name=usvalzsmprd02,Environment=Production,Application=Storm


#USOR prd
#SM-NB-UI
knife ec2 server create -I ami-ab09479b --bootstrap-version 11.16.4 --security-group-ids sg-cfa94faa, sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usorlzsmprd01 --fqdn usorlzsmprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-ui], role[vlg-lz-sm-nb]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags  Platform=Eliza,Owner=Eliza,Name=usorlzsmprd01,Environment=Production,Application=Storm
#SM-SV
knife ec2 server create -I ami-ab09479b --bootstrap-version 11.16.4 --security-group-ids sg-cfa94faa, sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usorlzsmprd02 --fqdn usorlzsmprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-sv]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags  Platform=Eliza,Owner=Eliza,Name=usorlzsmprd02,Environment=Production,Application=Storm

#EUIR prd
#SM-NB-UI
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzsmprd01 --fqdn euirlzsmprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-ui], role[vlg-lz-sm-nb]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags  Platform=Eliza,Owner=Eliza,Name=euirlzsmprd01,Environment=Production,Application=Storm
#SM-SV
knife ec2 server create -I ami-fe6bc589 --bootstrap-version 11.16.4 --security-group-ids sg-d17096b4,sg-50485132 --subnet subnet-a49280c6 --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N euirlzsmprd02 --fqdn euirlzsmprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-sv]" --region=eu-west-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags  Platform=Eliza,Owner=Eliza,Name=euirlzsmprd02,Environment=Production,Application=Storm

#APSG prd
#SM-NB-UI
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzsmprd01 --fqdn apsglzsmprd01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-ui], role[vlg-lz-sm-nb]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=apsglzsmprd01,Environment=Production,Application=Storm
#SM-SV
knife ec2 server create -I ami-0ccaeb5e --bootstrap-version 11.16.4 --security-group-ids sg-72110810,sg-57e4f735 --subnet subnet-bd5e4ddf --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N apsglzsmprd02 --fqdn apsglzsmprd02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-sv]" --region=ap-southeast-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Name=apsglzsmprd02,Environment=Production,Application=Storm

#USVA stg
#EBS-HVM-ami
knife ec2 server create -I ami-3ce05354 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzsmstg01 --fqdn usvalzsmstg01.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-ui], role[vlg-lz-sm-nb]" --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Owner=Eliza,Name=usvalzsmstg01,Environment=Staging,Application=Storm
#SM-NB-UI
knife ec2 server create -I ami-3ce05354 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c3.xlarge --ssh-user root --identity-file ~/.ssh/gio-keypair.pem -N usvalzsmstg02 --fqdn usvalzsmstg02.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-sm], role[vlg-lz-sm-sv]" --region=us-east-1 --environment staging --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Owner=Eliza,Name=usvalzsmstg02,Environment=Staging,Application=Storm
#SM-NB-UI