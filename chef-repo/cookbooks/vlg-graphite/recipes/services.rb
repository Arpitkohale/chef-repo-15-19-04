#
# Cookbook Name:: vlg-graphite
# Recipe:: services
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

services = [ 'nginx', 'memcached', 'mongod', 'carbon-cache', 'uwsgi', 'carbon-c-relay', 'seyren', 'grafana-server' ]
services.each do |service_name|
  service service_name do
    action [ :enable, :start]
  end
end
