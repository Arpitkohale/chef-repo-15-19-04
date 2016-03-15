#
# Cookbook Name:: vlg-s3fs
# Recipe:: passwd
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("aws", "videology")
aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

file "/root/.passwd-s3fs" do
  content "#{aws_access_key_id}:#{aws_secret_access_key}"
  owner 'root'
  group 'root'
  mode 0600
end
