# Cookbook Name:: vlg-storm
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-storm']['download_url']

# Download and unpack
ark 'storm' do
  url download_url
  version node['vlg-storm']['version']
  path node['vlg-storm']['install_dir']
  home_dir node['vlg-storm']['home_dir']
end

link node['vlg-storm']['home_dir'] + '/logs' do
  to node['vlg-storm']['log_dir']
end

file "#{node['vlg-storm']['lib_dir']}/log4j-over-slf4j-1.6.6.jar" do
  action :delete
end

remote_file "#{node['vlg-storm']['lib_dir']}/log4j-1.2.17.jar" do
  source "http://videologypublic.s3.amazonaws.com/repo/log4j-1.2.17.jar"
  owner node['vlg-storm']['user']
  group node['vlg-storm']['group']
  mode   00644
  action :create
end

# actually node['vlg-storm']['home_dir'] is symlink, so that "directory" won't work
execute 'storm-home-dir-owner' do
  command "chown -R " + "#{node['vlg-storm']['user']}" + ":" + "#{node['vlg-storm']['user']}" + " " + "#{node['vlg-storm']['home_dir']}/"
  not_if "stat -c %U #{node['vlg-storm']['home_dir']}/bin/storm | grep -E '^#{node['vlg-storm']['user']}$'"
end
