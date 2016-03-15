#
# Cookbook Name:: vlg-vl-cb
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-vl-cb::dirs"

unless Chef::Config[:solo]
  include_recipe "vlg-vl-cb::ebs"
  include_recipe "vlg-vl-cb::mounts"
end
include_recipe "couchbase::server"
