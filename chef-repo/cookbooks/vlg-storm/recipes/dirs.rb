# Cookbook Name:: vlg-storm
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directories = [
    node['vlg-storm']['log_dir'],
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-storm']['user']
    group node['vlg-storm']['group']
    mode '0755'
    action :create
    recursive true
  end
end
