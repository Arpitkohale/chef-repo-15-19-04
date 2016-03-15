#
# Cookbook Name:: vlg-haproxy
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# A really simple default haproxy.cfg. Overwrite this in your wrapper cookbook.
template "#{node['vlg-haproxy']['etc_dir']}/haproxy.cfg" do
  source "haproxy.cfg.erb"
  owner 'root'
  group 'root'
  mode "0755"
  action :create
  notifies :run, "execute[reload_haproxy]", :delayed
end

execute "reload_haproxy" do
  action :nothing
  command "/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -c && /etc/init.d/haproxy reload"
end
