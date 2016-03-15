#
# Cookbook Name:: vlg-kafka
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-kafka']['kafka_home'],
  node['vlg-kafka']['conf_dir'],
  node['vlg-kafka']['logs_dir'],
  node['vlg-kafka']['libs_dir']
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-kafka']['user']
    group node['vlg-kafka']['group']
    mode "0755"
    recursive true
  end
end
