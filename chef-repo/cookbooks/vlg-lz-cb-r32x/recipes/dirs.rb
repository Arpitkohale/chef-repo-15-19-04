#
# Cookbook Name:: vlg-lz-cb-r32x
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-couchbase']['data_dir'] do
  owner "#{node['vlg-couchbase']['user']}"
  group "#{node['vlg-couchbase']['group']}"
  mode '0755'
end
