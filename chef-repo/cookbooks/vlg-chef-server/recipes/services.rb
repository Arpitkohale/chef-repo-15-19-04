#
# Cookbook Name:: vlg-chef-server
# Recipe:: services
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

services = [ 'redis' ]
services.each do |service_name|
  service service_name do
    action [ :enable, :start]
  end
end
