#!/bin/bash

# 1) build the new instance
# # usvadtcmprdN (cdh manager / jumpbox)
knife ec2 server create -I ami-3218595b --bootstrap-version 11.16.4 --security-group-ids sg-858b24e0 --subnet subnet-d0556796 --associate-public-ip --ssh-key gio-keypair -f m3.xlarge --ssh-user ec2-user --identity-file ~/.ssh/keypairs/gio-keypair.pem -N <node-name> --fqdn <node-name>.inf.videologygroup.com --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Data,Owner=Systems,Name=<node-name>,Environment=Production,Application=CDH --placement-group 'CDH-PROD' --ephemeral '/dev/sdb,/dev/sdc' --ebs-size 128

# usvacdhprdN (cdh data node)
knife ec2 server create -I ami-3218595b --bootstrap-version 11.16.4 --security-group-ids sg-858b24e0 --subnet subnet-d0556796 --associate-public-ip --ssh-key gio-keypair -f cc2.8xlarge --ssh-user ec2-user --identity-file ~/.ssh/keypairs/gio-keypair.pem -N <node-name> --fqdn <node-name>.inf.videologygroup.com --region=us-east-1 --environment production --secret-file ~/.chef/encrypted_data_bag_secret --tags Platform=Data,Owner=Systems,Name=<node-name>,Environment=Production,Application=CDH --placement-group 'CDH-PROD' --ephemeral '/dev/sdb,/dev/sdc,/dev/sdd,/dev/sde' --ebs-size 128

# 2) extend the root partition and get rid of /mnt
ssh ~/.ssh/keypairs/gio-keypair.pem ec2-user@<private-ip>
sudo umount /mnt
sudo sed -i '/mnt/d' /etc/fstab
(echo d; echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/xvda
sudo reboot

# 3) bootstrap the node with the proper roles
knife bootstrap <private-ip> --bootstrap-version 11.16.4 --ssh-user ec2-user --sudo --identity-file ~/.ssh/keypairs/gio-keypair.pem -N <node-name> --run-list role[vlg-base],role[vlg-data-cdh] --environment production --secret-file ~/.chef/encrypted_data_bag_secret

# 4) tie up loose ends by running chef-client a few times
ssh <private-ip>
for i in `seq -w 01 05`; do sudo chef-client; done
knife ssh "role:vlg-data-cdh AND chef_environment:production" "sudo chef-client"
