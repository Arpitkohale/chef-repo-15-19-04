#
# Cookbook Name:: vlg-opt-lite-mc
# Recipe:: install
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#
#

service "memcached" do
  action [ :enable, :start ]
end
