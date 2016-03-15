#
# Cookbook Name:: vlg-tomcat
# Recipe:: logrotate
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Log rotation
template '/etc/logrotate.d/tomcat' do
  source 'logrotate.erb'
end
