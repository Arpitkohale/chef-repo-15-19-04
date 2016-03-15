#
# Cookbook Name:: vlg-all-in-one
# Recipe:: couchbase
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['couchbase']['server']['data_dir'] do
  owner 'couchbase'
  group 'couchbase'
  mode '0755'
  recursive true
end

include_recipe "couchbase::server"