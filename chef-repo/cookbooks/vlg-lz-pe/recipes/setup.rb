#
# Cookbook Name:: vlg-lz-pe
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file File.join(Chef::Config[:file_cache_path], node['vlg-lz-pe']['package_file']) do
  source node['vlg-lz-pe']['package_full_url']
  action :create_if_missing
end

yum_package File.join(Chef::Config[:file_cache_path], node['vlg-lz-pe']['package_file'])

service 'haproxy' do
  action [:enable]
end

# reloading to avoid memory leak, will be removed later
cron 'weekly-haproxy-reload' do
  minute  '1'
  hour    '4'
  weekday '1'
  command '/etc/init.d/haproxy reload'
  user    'root'
  mailto  'asinitsa.consultant@videologygroup.com'
end
