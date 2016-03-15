#
# Cookbook Name:: vlg-s3cmd
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("aws", "videology")
aws_access_key_id = data["aws_access_key_id"]
aws_secret_access_key = data["aws_secret_access_key"]

template "#{node['vlg-base']['app_user_home']}/.s3cfg" do
        source "s3cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
	action :create
        variables({
        :aws_access_key_id => "#{aws_access_key_id}",
	      :aws_secret_access_key => "#{aws_secret_access_key}"
        })
end
