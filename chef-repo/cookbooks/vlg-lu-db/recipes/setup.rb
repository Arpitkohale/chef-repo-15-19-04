#
# Cookbook Name:: vlg-lu-db
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

mysql_service "#{node['vlg-lu-db']['mysql_service_name']}" do
  port "#{node["vlg-lu-db"]["mysql_port"]}"
  version "#{node["vlg-lu-db"]["mysql_version"]}"
  data_dir "#{node["vlg-lu-db"]["mysql_data_dir"]}"
  bind_address "#{node["vlg-lu-db"]["mysql_bind_address"]}"
  initial_root_password "#{node["vlg-lu-db"]["mysql_root_password"]}"
  action [:create, :start]
end
