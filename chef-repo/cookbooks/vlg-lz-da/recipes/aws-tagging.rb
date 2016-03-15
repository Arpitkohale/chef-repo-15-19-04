#
# Cookbook Name:: vlg-lz-da
# Recipe:: aws
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#


unless Chef::Config[:solo]
  aws = Chef::EncryptedDataBagItem.load("aws", "videology")
  aws_resource_tag node['ec2']['instance_id'] do
    aws_access_key aws['aws_access_key_id']
    aws_secret_access_key aws['aws_secret_access_key']
    tags({'Name' => node['hostname'],
          'Environment' => node.chef_environment,
	        'Platform' => 'Eliza',
	        'Owner' => 'Systems',
	        'Application' => 'Data API'
        })
    action :update
  end
end
