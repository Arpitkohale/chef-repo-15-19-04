#
# Cookbook Name:: vlg-zookeeper
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-zookeeper']['download_url']

# Create group
group node['vlg-zookeeper']['group']

# Create user
user node['vlg-zookeeper']['user'] do
  group node['vlg-zookeeper']['group']
  system true
  shell '/bin/bash'
end

# Download and unpack
ark 'apache-zookeeper' do
  url download_url
  version node['vlg-zookeeper']['version']
  path node['vlg-zookeeper']['install_dir']
  home_dir "#{node['vlg-zookeeper']['install_dir']}/zookeeper"
end
