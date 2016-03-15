#
# Cookbook Name:: vlg-activemq
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-activemq']['download_url']

# Create group
group node['vlg-activemq']['group']

# Create user
user node['vlg-activemq']['user'] do
  group node['vlg-activemq']['group']
  system true
  shell '/bin/bash'
end

# Download and unpack
ark 'apache-activemq' do
  url download_url
  version node['vlg-activemq']['version']
  path node['vlg-activemq']['install_dir']
  home_dir "#{node['vlg-activemq']['install_dir']}/activemq"
end
