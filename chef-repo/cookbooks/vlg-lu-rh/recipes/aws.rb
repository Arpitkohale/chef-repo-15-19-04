#
# Cookbook Name:: vlg-lu-rh
# Recipe:: aws
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# aws tagging
aws = Chef::EncryptedDataBagItem.load("aws", "videology")
aws_resource_tag node['ec2']['instance_id'] do
  aws_access_key aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
  tags({"Name" => node['hostname'],
        "Environment" => node.chef_environment,
	"Platform" => "Lucy",
	"Owner" => "Systems",
	"Application" => "Request Handler"})
  action :update
end
