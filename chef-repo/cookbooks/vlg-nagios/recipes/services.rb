#
# Cookbook Name:: vlg-nagios
# Recipe:: services
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

services = [ 'httpd', 'nagios', 'pdagent' ]
services.each do |service_name|
  service service_name do
    action [ :enable, :start]
  end
end
