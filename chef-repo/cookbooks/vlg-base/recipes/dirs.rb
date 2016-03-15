#
# Cookbook Name:: vlg-base
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-base']['bin_dir'],
  node['vlg-base']['etc_dir'],
  node['vlg-base']['etc_dir'] + "/aws",
  node['vlg-base']['log_dir'],
  node['vlg-base']['log_dir'] + "/cleanup"
]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode '0755'
    action :create
  end
end
