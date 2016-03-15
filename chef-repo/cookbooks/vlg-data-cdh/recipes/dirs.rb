#
# Cookbook Name:: vlg-data-cdh
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "/data" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
