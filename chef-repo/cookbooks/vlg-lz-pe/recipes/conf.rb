#
# Cookbook Name:: vlg-lz-pe
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  notifies :reload, 'service[haproxy]', :immediately
end