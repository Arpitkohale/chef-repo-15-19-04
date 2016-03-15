#
# Cookbook Name:: vlg-data-cdh
# Recipe:: limits
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/security/limits.d/cdh.conf' do
  source 'limits.conf'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
