#
# Cookbook Name:: vlg-lz-zk
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment ==  "production"
		include_recipe "vlg-lz-zk::nrpe_checks"
end
include_recipe "vlg-zookeeper::default"
