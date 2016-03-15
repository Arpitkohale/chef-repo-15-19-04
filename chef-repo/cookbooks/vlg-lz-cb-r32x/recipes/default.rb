#
# Cookbook Name:: vlg-lz-cb-r32x
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

case node.chef_environment
  when "production"
    include_recipe_now "vlg-lz-cb-r32x::dirs"
    include_recipe_now "vlg-lz-cb-r32x::ebs"
    include_recipe "vlg-lz-cb-r32x::setup"
    include_recipe "sysctl::apply"
    include_recipe "vlg-lz-cb-r32x::nrpe_checks"
  when "staging"
    include_recipe_now "vlg-lz-cb-r32x::dirs"
    include_recipe_now "vlg-lz-cb-r32x::ebs"
    include_recipe "vlg-lz-cb-r32x::setup"
    include_recipe "sysctl::apply"
  when "sandbox"
    include_recipe_now "vlg-lz-cb-r32x::dirs"
    include_recipe "vlg-lz-cb-r32x::setup"
    include_recipe "sysctl::apply"
  when "endtoend"
    include_recipe_now "vlg-lz-cb-r32x::dirs"
    include_recipe "vlg-lz-cb-r32x::setup"
    include_recipe "sysctl::apply"
  else
    include_recipe_now "vlg-lz-cb-r32x::dirs"
    include_recipe "vlg-lz-cb-r32x::setup"
end
