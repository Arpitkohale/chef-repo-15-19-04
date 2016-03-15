#
# Cookbook Name:: vlg-swap
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['vlg-swap']['enable'] == true
  swap_file node['vlg-swap']['path'] do
    size node['vlg-swap']['size']
    persist node['vlg-swap']['persist']
  end
end
