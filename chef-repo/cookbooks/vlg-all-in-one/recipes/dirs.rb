#
# Cookbook Name:: vlg-all-in-one
# Recipe:: agent
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "/data" do
  owner "root"
  group "root"
  mode "0755"
  recursive true
end

directory node['vlg-kafka']['data_dir'] do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
end

directory node['vlg-kafka']['logs_dir'] do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
end
