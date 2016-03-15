#
# Cookbook Name:: vlg-lz-cb
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-lz-cb::dirs"

unless Chef::Config[:solo]
  include_recipe "vlg-lz-cb::ebs"
  include_recipe "vlg-lz-cb::mounts"
end
include_recipe "couchbase::server"
