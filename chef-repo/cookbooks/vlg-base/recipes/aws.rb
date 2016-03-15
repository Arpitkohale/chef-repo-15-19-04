#
# Cookbook Name:: vlg-base
# Recipe:: aws
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# videology-rw
videology_data = Chef::EncryptedDataBagItem.load("aws", "videology")
videology_aws_access_key_id = videology_data["aws_access_key_id"]
videology_aws_secret_access_key = videology_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/videology.cfg" do
        source "aws-videology.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
	    action :create
        variables({
              :videology_aws_access_key_id => "#{videology_aws_access_key_id}",
	          :videology_aws_secret_access_key => "#{videology_aws_secret_access_key}"
        })
end

# videology-ro
videology_ro_data = Chef::EncryptedDataBagItem.load("aws", "videology-ro")
videology_ro_aws_access_key_id = videology_ro_data["aws_access_key_id"]
videology_ro_aws_secret_access_key = videology_ro_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/videology-ro.cfg" do
        source "aws-videology-ro.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :videology_ro_aws_access_key_id => "#{videology_ro_aws_access_key_id}",
              :videology_ro_aws_secret_access_key => "#{videology_ro_aws_secret_access_key}"
        })
end

# lmn-rw
lmn_data = Chef::EncryptedDataBagItem.load("aws", "lmn")
lmn_aws_access_key_id = lmn_data["aws_access_key_id"]
lmn_aws_secret_access_key = lmn_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/lmn.cfg" do
        source "aws-lmn.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :lmn_aws_access_key_id => "#{lmn_aws_access_key_id}",
              :lmn_aws_secret_access_key => "#{lmn_aws_secret_access_key}"
        })
end

# lmn-ro
lmn_ro_data = Chef::EncryptedDataBagItem.load("aws", "lmn-ro")
lmn_ro_aws_access_key_id = lmn_ro_data["aws_access_key_id"]
lmn_ro_aws_secret_access_key = lmn_ro_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/lmn-ro.cfg" do
        source "aws-lmn-ro.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :lmn_ro_aws_access_key_id => "#{lmn_ro_aws_access_key_id}",
              :lmn_ro_aws_secret_access_key => "#{lmn_ro_aws_secret_access_key}"
        })
end

# videologydev
videologydev_data = Chef::EncryptedDataBagItem.load("aws", "videologydev")
videologydev_aws_access_key_id = videologydev_data["aws_access_key_id"]
videologydev_aws_secret_access_key = videologydev_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/videologydev.cfg" do
        source "aws-videologydev.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :videologydev_aws_access_key_id => "#{videologydev_aws_access_key_id}",
              :videologydev_aws_secret_access_key => "#{videologydev_aws_secret_access_key}"
        })
end

# videologydev-ro
videologydev_ro_data = Chef::EncryptedDataBagItem.load("aws", "videologydev-ro")
videologydev_ro_aws_access_key_id = videologydev_ro_data["aws_access_key_id"]
videologydev_ro_aws_secret_access_key = videologydev_ro_data["aws_secret_access_key"]

template "#{node['vlg-base']['etc_dir']}/aws/videologydev-ro.cfg" do
        source "aws-videologydev-ro.cfg.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :videologydev_ro_aws_access_key_id => "#{videologydev_ro_aws_access_key_id}",
              :videologydev_ro_aws_secret_access_key => "#{videologydev_ro_aws_secret_access_key}"
        })
end

# creds.py
template "#{node['vlg-base']['etc_dir']}/aws/creds.py" do
        source "aws-creds.py.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0400"
        action :create
        variables({
              :videologydev_aws_access_key_id => "#{videologydev_aws_access_key_id}",
              :videologydev_aws_secret_access_key => "#{videologydev_aws_secret_access_key}",
              :videologydev_ro_aws_access_key_id => "#{videologydev_ro_aws_access_key_id}",
              :videologydev_ro_aws_secret_access_key => "#{videologydev_ro_aws_secret_access_key}",
              :videology_aws_access_key_id => "#{videology_aws_access_key_id}",
              :videology_aws_secret_access_key => "#{videology_aws_secret_access_key}",
              :videology_ro_aws_access_key_id => "#{videology_ro_aws_access_key_id}",
              :videology_ro_aws_secret_access_key => "#{videology_ro_aws_secret_access_key}",
              :lmn_aws_access_key_id => "#{lmn_aws_access_key_id}",
              :lmn_aws_secret_access_key => "#{lmn_aws_secret_access_key}",
              :lmn_ro_aws_access_key_id => "#{lmn_ro_aws_access_key_id}",
              :lmn_ro_aws_secret_access_key => "#{lmn_ro_aws_secret_access_key}",
        })
end
