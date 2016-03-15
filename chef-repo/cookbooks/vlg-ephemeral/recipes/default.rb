#
# Cookbook Name:: vlg-ephemeral
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['vlg-ephemeral']['configuration'] == "striped"
  include_recipe_now "vlg-ephemeral::striped"
end

if node['vlg-ephemeral']['configuration'] == "jbod"
  include_recipe_now "vlg-ephemeral::jbod"
end

if node['vlg-ephemeral']['configuration'] == "disable"
  include_recipe "vlg-ephemeral::disable"
end
