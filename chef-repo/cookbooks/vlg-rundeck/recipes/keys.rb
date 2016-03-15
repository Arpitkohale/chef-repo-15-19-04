#
# Cookbook Name:: vlg-rundeck
# Recipe:: keys
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# amnet
data = Chef::EncryptedDataBagItem.load("data-keys", "amnet")
amnet_id_rsa_private = data["id_rsa_private"]
template "/home/#{node['vlg-rundeck']['user']}/.ssh/id_rsa_amnet" do
  source 'amnet_id_rsa_private.erb'
  mode '0600'
  owner node['vlg-rundeck']['user']
  group node['vlg-rundeck']['user']
  action :create
  only_if "test -d /home/#{node['vlg-rundeck']['user']}/.ssh"
  variables :amnet_id_rsa_private => amnet_id_rsa_private
end
