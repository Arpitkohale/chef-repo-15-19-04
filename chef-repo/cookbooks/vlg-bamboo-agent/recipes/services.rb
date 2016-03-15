#
# Cookbook Name:: vlg-bamboo-agent
# Recipe:: services
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

services = [ 'activemq', 'memcached', 'mysql-default', 'redis6379', 'couchbase-server', 'storm-supervisor', 'haproxy', 'zookeeper', 'kafka', 'solr', 'bamboo-agent' ]
services.each do |service_name|
  service service_name do
    action [ :enable, :start]
  end
end
