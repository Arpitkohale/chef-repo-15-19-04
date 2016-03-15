#
# Cookbook Name:: vlg-lz-pe
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# haproxy.cfg template override
begin
  t = resources(:template => "#{node['vlg-haproxy']['etc_dir']}/haproxy.cfg")
  t.source "haproxy.cfg.erb"
  t.cookbook "vlg-lz-pi"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-haproxy']['etc_dir']}/haproxy.cfg to modify"
end

