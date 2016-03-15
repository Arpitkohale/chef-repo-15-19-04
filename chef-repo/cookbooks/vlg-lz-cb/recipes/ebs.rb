#
# Cookbook Name:: vlg-lz-cb
# Recipe:: ebs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("aws", "videology")

aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

aws_ebs_volume "Data" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 800
  volume_type "io1"
  piops 4000
  device "/dev/sdj"
  action [ :create, :attach ]
end


