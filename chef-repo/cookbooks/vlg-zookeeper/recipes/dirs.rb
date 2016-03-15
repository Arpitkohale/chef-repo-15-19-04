#
# Cookbook Name:: vlg-zookeeper
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-zookeeper']['zookeeper_base'],
  node['vlg-zookeeper']['conf_dir'],
  node['vlg-zookeeper']['logs_dir'],
  node['vlg-zookeeper']['data_dir']
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-zookeeper']['user']
    group node['vlg-zookeeper']['group']
    mode "0755"
    recursive true
  end
end
