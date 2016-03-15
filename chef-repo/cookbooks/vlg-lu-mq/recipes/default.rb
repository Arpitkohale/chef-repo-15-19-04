#
# Cookbook Name:: vlg-lu-mq
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-activemq::default"
include_recipe "vlg-lu-mq::conf"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
end
