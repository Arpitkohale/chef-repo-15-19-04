#
# Cookbook Name:: vlg-base
# Recipe:: syslog
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# direct root login alert
template '/etc/rsyslog.d/45-root-login-alert.conf' do
  source 'rsyslog-root-login-alert.conf.erb'
  mode '0644'
  action :create
  notifies :restart, "service[rsyslog]", :delayed
end
