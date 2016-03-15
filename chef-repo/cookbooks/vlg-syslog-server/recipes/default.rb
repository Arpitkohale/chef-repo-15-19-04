#
# Cookbook Name:: vlg-syslog-server
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-syslog-server::dirs"
if node.chef_environment == "production"
  include_recipe "vlg-syslog-server::ebs"
  include_recipe "vlg-syslog-server::mount"
end
include_recipe "rsyslog::server"
