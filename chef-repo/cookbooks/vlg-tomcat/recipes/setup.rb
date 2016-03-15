#
# Cookbook Name:: vlg-tomcat
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-tomcat']['download_url']

# Create group
group node['vlg-tomcat']['group']

# Create user
user node['vlg-tomcat']['user'] do
  group node['vlg-tomcat']['group']
  system true
  shell '/bin/bash'
end

# Download and unpack
ark 'apache-tomcat' do
  url download_url
  version node['vlg-tomcat']['version']
  path node['vlg-tomcat']['install_dir']
  home_dir "#{node['vlg-tomcat']['install_dir']}/tomcat"
end
