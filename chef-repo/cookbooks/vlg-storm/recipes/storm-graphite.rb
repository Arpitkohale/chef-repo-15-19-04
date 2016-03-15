# Cookbook Name:: vlg-storm
# Recipe:: storm-graphite
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Download storm-graphite
remote_file node['vlg-storm']['storm-graphite']['install_dest']  do
  source node['vlg-storm']['storm-graphite']['url']
  checksum node['vlg-storm']['storm-graphite']['checksum']
  owner node['vlg-storm']['user']
  group node['vlg-storm']['group']
  action :create
end
