#
# Cookbook Name:: vlg-lz-sm
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::dirs"
include_recipe "vlg-storm::default"
case node.chef_environment
  when "production"
    include_recipe "vlg-lz-sm::nrpe_checks"
  end
