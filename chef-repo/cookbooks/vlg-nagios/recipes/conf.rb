#
# Cookbook Name:: vlg-nagios
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# nagios.conf
template '/etc/httpd/conf.d/nagios.conf' do
  source 'httpd.conf.erb'
  mode '0755'
  action :create
  notifies :restart, "service[httpd]", :immediately
end
