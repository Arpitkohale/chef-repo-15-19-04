# Cookbook Name:: vlg-lz-cb-r32x
# Recipe:: nrpe_checks
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#


nrpe_check "check_ui_tcp_port" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '20'
  parameters "-H localhost -p 8091"
  action :add
end

nrpe_check "check_api_tcp_port" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '20'
  parameters "-H localhost -p 8092"
  action :add
end

nrpe_check "check_bucket_tcp_port" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '20'
  parameters "-H localhost -p 11210"
  action :add
end

nrpe_check "check_client_tcp_port" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '20'
  parameters "-H localhost -p 11211"
  action :add
end
