#
# Cookbook Name:: vlg-lu-mc
# Recipe:: services
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

service "memcached" do
  action [ :enable, :start ]
end
