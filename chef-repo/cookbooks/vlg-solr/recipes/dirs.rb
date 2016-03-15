#
# Cookbook Name:: vlg-solr
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-solr']['logs_dir'],
  node['vlg-solr']['home_dir'],
  node['vlg-solr']['lib_dir']
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-solr']['user']
    group node['vlg-solr']['group']
    mode "0755"
    recursive true
  end
end
