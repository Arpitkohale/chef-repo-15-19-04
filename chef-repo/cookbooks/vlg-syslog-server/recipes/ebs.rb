#
# Cookbook Name:: vlg-syslog-server
# Recipe:: ebs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("aws", "videology")

aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

aws_ebs_volume "syslog_ebs_volume" do
  aws_access_key aws_access_key_id
  aws_secret_access_key aws_secret_access_key
  size 1024
  volume_type "gp2"
  device "/dev/sdj"
  action [ :create, :attach ]
end

aws_resource_tag "syslog_ebs_volume" do
  resource_id lazy { node['aws']['ebs_volume']['syslog_ebs_volume']['volume_id'] }
  tags ({"Service" => "syslog"})
end
