#!/bin/bash

#USOR prd
# us-west-2a
knife ec2 server create --ebs-size 100 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-42a4b820 --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzcmprd03 --fqdn usorlzcmprd03.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cm]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=CM
# us-west-2b
knife ec2 server create --ebs-size 100 -I ami-e7527ed7 --bootstrap-version 11.16.4 --security-group-ids sg-a76c85c2 --subnet subnet-d43233a0 --associate-public-ip --ssh-key gio-keypair -f c4.xlarge --ssh-user ec2-user --server-connect-attribute private_ip_address --identity-file ~/.ssh/gio-keypair.pem -N usorlzcmprd04 --fqdn usorlzcmprd04.inf.videologygroup.com --run-list "role[vlg-base], role[vlg-lz-cm]" --region=us-west-2 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Eliza,Environment=Production,Application=CM

