#
# Cookbook Name:: vlg-l-mq
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "/data" do
  recursive true
  action :create
  mode 0755
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
end
