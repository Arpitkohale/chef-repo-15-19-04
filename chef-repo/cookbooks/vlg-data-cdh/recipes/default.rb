#
# Cookbook Name:: vlg-data-cdh
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "sysctl::apply"
include_recipe "vlg-data-cdh::mtu"
include_recipe "vlg-data-cdh::smp_affinity"
include_recipe "vlg-data-cdh::sysfs"
include_recipe "vlg-data-cdh::dirs"
include_recipe "vlg-data-cdh::links"
include_recipe "vlg-data-cdh::repo"
include_recipe "vlg-data-cdh::limits"
include_recipe "vlg-data-cdh::hosts"
include_recipe "vlg-data-cdh::lib"
include_recipe "vlg-ssh-key::default"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
end
if node.chef_environment == "sandbox"
  include_recipe "vlg-data-cdh::ebs"
end
