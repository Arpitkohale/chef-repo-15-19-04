#
# Cookbook Name:: vlg-clicksense
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::dirs"
unless Chef::Config[:solo]
  include_recipe "vlg-s3cmd::default"
  include_recipe "vlg-clicksense::resources"
  include_recipe "vlg-clicksense::syslog"
end
