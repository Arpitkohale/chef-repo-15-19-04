#
# Cookbook Name:: vlg-lu-cm
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-lu-cm::dirs"
include_recipe "vlg-lu-cm::conf"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
end
if node.chef_environment == "production"
  include_recipe "vlg-lu-cm::syslog"
end
