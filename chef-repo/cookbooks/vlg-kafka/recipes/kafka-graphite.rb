# Cookbook Name:: vlg-kafka
# Recipe:: storm-graphite
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Download metrics-graphite
remote_file node['vlg-kafka']['metrics-graphite']['install_dest']  do
  source node['vlg-kafka']['metrics-graphite']['url']
  checksum node['vlg-kafka']['metrics-graphite']['checksum']
  owner node['vlg-kafka']['user']
  group node['vlg-kafka']['group']
  action :create
end

# Download kafka-graphite
remote_file node['vlg-kafka']['kafka-graphite']['install_dest']  do
  source node['vlg-kafka']['kafka-graphite']['url']
  checksum node['vlg-kafka']['kafka-graphite']['checksum']
  owner node['vlg-kafka']['user']
  group node['vlg-kafka']['group']
  action :create
end
