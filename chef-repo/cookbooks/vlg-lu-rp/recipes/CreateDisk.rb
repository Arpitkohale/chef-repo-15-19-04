#
# Cookbook Name:: vlg-lu-rp
# Recipe:: CreateDisk
#
# Copyright 2015, Videology Group, Inc.
#

include_recipe 'aws'

data = Chef::EncryptedDataBagItem.load("aws", "videology")

aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

aws_ebs_volume "vol" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 200
  device "/dev/sdh"
  action [ :create, :attach ]
end

aws_ebs_volume "store3" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 500
  device "/dev/sdi"
  action [ :create, :attach ]
end

aws_ebs_volume "store1" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 1000
  device "/dev/sdj"
  action [ :create, :attach ]
end

aws_ebs_volume "store2" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 650
  device "/dev/sdk"
  action [ :create, :attach ]
end

aws_ebs_volume "reportingdir" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 1000
  device "/dev/sdl"
  action [ :create, :attach ]
end

aws_ebs_volume "backup" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 750
  device "/dev/sdm"
  action [ :create, :attach ]
end

aws_ebs_volume "store4" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 1000
  device "/dev/sdn"
  action [ :create, :attach ]
end