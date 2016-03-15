#
# Cookbook Name:: vlg-ssh-key
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

data = Chef::EncryptedDataBagItem.load("ssh", "#{node['vlg-base']['app_user']}_id_rsa")
id_rsa_key = data["key"]

file "#{node['vlg-base']['app_user_home']}/.ssh/id_rsa" do
  content "#{id_rsa_key}"
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode 0600
  only_if "test -d #{node['vlg-base']['app_user_home']}/.ssh"
end
