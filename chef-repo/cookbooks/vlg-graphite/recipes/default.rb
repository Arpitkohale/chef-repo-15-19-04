#
# Cookbook Name:: vlg-graphite
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-graphite::repo"
include_recipe "vlg-graphite::dirs"
include_recipe "vlg-graphite::setup"
include_recipe "vlg-graphite::init"
include_recipe "vlg-graphite::conf"
include_recipe "vlg-java::default"
include_recipe "vlg-graphite::services"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
end
if node.chef_environment == 'production'
  include_recipe "vlg-s3cmd::default"
end
