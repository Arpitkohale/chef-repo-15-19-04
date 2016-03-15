#
# Cookbook Name:: vlg-lz-pc
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file File.join(Chef::Config[:file_cache_path], node['vlg-lz-pc']['package_file']) do
  source node['vlg-lz-pc']['package_full_url']
  action :create_if_missing
end

yum_package File.join(Chef::Config[:file_cache_path], node['vlg-lz-pc']['package_file'])

service 'haproxy' do
  action [:enable]
end
