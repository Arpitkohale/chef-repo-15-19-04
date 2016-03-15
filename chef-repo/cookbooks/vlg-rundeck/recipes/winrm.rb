#
# Cookbook Name:: vlg-rundeck
# Recipe:: winrm
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "/var/lib/rundeck/libext/rundeck-winrm-plugin-#{node['vlg-rundeck']['winrm']['jar']['version']}.jar" do
  source node['vlg-rundeck']['winrm']['jar']['url']
  mode '0644'
  checksum node['vlg-rundeck']['winrm']['jar']['checksum']
end
