#
# Cookbook Name:: vlg-lz-px-da
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# haproxy.cfg template override
begin
  t = resources(:template => "#{node['vlg-haproxy']['etc_dir']}/haproxy.cfg")
  t.source "haproxy.cfg.erb"
  t.cookbook "vlg-lz-px-di"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-haproxy']['etc_dir']}/haproxy.cfg to modify"
end

# 503 custom response
template node['vlg-haproxy']['etc_dir'] + "/503.error.html" do
  source "503.error.html.erb"
  mode "0755"
  action :create
end
