#
# Cookbook Name:: vlg-lu-mc
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# memcached
template '/etc/sysconfig/memcached' do
  source 'memcached.erb'
  mode '0755'
  action :create
  notifies :restart, "service[memcached]", :delayed
end
