#
# Cookbook Name:: vlg-lz-cb
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# the couchbase::server recipe takes care of the directories under the data dir

# create dirs and set proper permissions
directories = [
  node['vlg-lz-cb']['data_dir']
]

directories.each do |dir_name|
  directory dir_name do
    owner "root"
    group "root"
    mode '0755'
    action :create
  end
end
