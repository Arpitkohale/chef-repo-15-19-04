#
# Cookbook Name:: vlg-lz-kz
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "/data" do
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
  recursive true
end

directory "/var/log/zookeeper" do
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
  recursive true
end