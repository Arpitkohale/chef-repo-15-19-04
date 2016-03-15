#
# Cookbook Name:: vlg-chef-server
# Recipe:: config
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute

# If this file changes you have to rerun 'chef-server-ctl reconfigure'. I didn't want to add this logic to the recipe because that might break Chef. The reconfigure should be done in a controlled environment.
cookbook_file "/etc/chef-server/chef-server.rb" do
  source "chef-server.rb"
  owner "root"
  group "root"
  mode "0644"
  only_if { ::File.exists?("/etc/chef-server") }
end

cookbook_file "/etc/redis.conf" do
  source "redis.conf"
  owner "root"
  group "root"
  mode "0644"
  only_if "test -f /usr/sbin/redis-server"
  notifies :restart, "service[redis]", :delayed
end
