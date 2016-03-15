#
# Cookbook Name:: vlg-lz-cb-r32x
# Recipe:: ebs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("aws", "videology")

aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

aws_ebs_volume "Couchbase-data-and-logs" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size node['vlg-lz-cb-r32x']['ebs_data_size']
  device '/dev/sdj'
  volume_type 'io1'
  piops node['vlg-lz-cb-r32x']['ebs_iops']
  action [ :create, :attach ]
end

execute "mkfs.ext4 /dev/xvdj" do
  command "mkfs.ext4 /dev/xvdj"
  not_if  "grep -w /dev/xvdj /proc/mounts /etc/fstab"
end

mount node['vlg-couchbase']['data_dir'] do
  device "/dev/xvdj"
  fstype "ext4"
  action [:mount, :enable]
end

