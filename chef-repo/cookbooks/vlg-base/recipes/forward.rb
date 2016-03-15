#
# Cookbook Name:: vlg-base
# Recipe:: forward
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

file "#{node['vlg-base']['app_user_home']}/.forward" do
  content 'root'
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode 0600
end
