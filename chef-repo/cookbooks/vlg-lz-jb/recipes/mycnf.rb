#
# Cookbook Name:: vlg-lz-jb
# Recipe:: mycnf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "#{node['vlg-base']['app_user_home']}/.my.cnf" do
  source 'mycnf.erb'
  mode '0600'
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  action :create
end