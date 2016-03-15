#!/bin/bash

####knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-d2e4d2a6 --associate-public-ip --ssh-key gio-keypair -f c4.8xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvardccc4sbx06 --fqdn usvardccc4sbx06.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rnd-tv] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=RnD,Owner=Systems,Name=usvardccc4sbx06,Environment=Sandbox,Application=Opt,Component=LP

knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-d2e4d2a6 --associate-public-ip --ssh-key gio-keypair -f c4.8xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvardtvsbx01 --fqdn usvardtvsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rnd-tv] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=RnD,Owner=Systems,Name=usvardtvsbx01,Environment=Sandbox,Application=TV



###knife ec2 server create -I ami-1ecae776 --bootstrap-version 11.16.4 --security-group-ids sg-46c73923 --subnet subnet-72d9a05a --associate-public-ip --ssh-key gio-keypair -f c4.8xlarge --ssh-user ec2-user --identity-file ~/VLG/gio/AWS\ Keypairs/gio-keypair.pem -N usvardtvsbx01 --fqdn usvardtvsbx01.inf.videologygroup.com --run-list role[vlg-base],role[vlg-rnd-tv] --region=us-east-1 --environment sandbox --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=RnD,Owner=Systems,Name=usvardtvsbx01,Environment=Sandbox,Application=TV
