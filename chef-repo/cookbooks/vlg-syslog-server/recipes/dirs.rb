#
# Cookbook Name:: vlg-syslog-server
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-syslog-server']['data_mount'] do
  recursive true
  action :create
  mode 0755
  owner 'root'
  group 'root'
end

directory node['rsyslog']['log_dir'] do
  recursive true
  action :create
  mode 0755
  owner node['rsyslog']['user']
  group node['rsyslog']['user']
end
