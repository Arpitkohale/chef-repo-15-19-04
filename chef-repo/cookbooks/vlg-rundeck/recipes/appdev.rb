#
# Cookbook Name:: vlg-rundeck
# Recipe:: appdev
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# rundeck project configs
template '/var/rundeck/projects/AppDev/etc/project.properties' do
  source 'appdev-project.properties.erb'
  mode '0644'
  action :create
  only_if "test -d /var/rundeck/projects/AppDev/"
end

template '/var/rundeck/projects/AppDev/etc/resources.xml' do
  source 'appdev-resources.xml.erb'
  mode '0644'
  action :create
  only_if "test -d /var/rundeck/projects/AppDev/"
end
