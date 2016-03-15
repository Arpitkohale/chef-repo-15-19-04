#
# Cookbook Name:: vlg-rundeck
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-base']['app_user_home'] + '/digitalEnvoy',
  node['vlg-base']['app_user_home'] + '/tmp',
  node['vlg-base']['app_user_home'] + '/data',
  node['vlg-base']['app_user_home'] + '/.groovy',
  node['vlg-rundeck']['backup_dir'],
  node['vlg-rundeck']['backup_dir'] + '/db',
  node['vlg-base']['log_dir'] + '/rundeck-db-backup',
  node['vlg-base']['log_dir'] + '/etlscripts'
]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
  end
end
