#
# Cookbook Name:: vlg-lz-ps
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "#{node['vlg-lz-ps']['haproxy']['etc_dir']}/haproxy.cfg" do
  source "haproxy.cfg.erb"
  notifies :reload, 'service[haproxy]', :immediately
end

# 500 custom response
template "#{node['vlg-lz-ps']['haproxy']['etc_dir']}/500.error.http" do
  source "500.error.http.erb"
  action :create
  notifies :reload, 'service[haproxy]', :immediately
end

# 502 custom response
template "#{node['vlg-lz-ps']['haproxy']['etc_dir']}/502.error.http" do
  source "502.error.http.erb"
  action :create
  notifies :reload, 'service[haproxy]', :immediately
end

# 503 custom response
template "#{node['vlg-lz-ps']['haproxy']['etc_dir']}/503.error.http" do
  source "503.error.http.erb"
  action :create
  notifies :reload, 'service[haproxy]', :immediately
end

# 504 custom response
template "#{node['vlg-lz-ps']['haproxy']['etc_dir']}/504.error.http" do
  source "504.error.http.erb"
  action :create
  notifies :reload, 'service[haproxy]', :immediately
end
