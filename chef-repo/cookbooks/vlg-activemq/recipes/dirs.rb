#
# Cookbook Name:: vlg-activemq
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  "#{node['vlg-activemq']['base_dir']}",
  "#{node['vlg-activemq']['conf_dir']}",
  "#{node['vlg-activemq']['data_dir']}",
  "#{node['vlg-activemq']['tmp_dir']}"
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-activemq']['user']
    group node['vlg-activemq']['group']
    mode "0755"
    recursive true
  end
end
