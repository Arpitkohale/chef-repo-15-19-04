#
# Cookbook Name:: vlg-all-in-one
# Recipe:: activemq
#
# Copyright 2015, Videology Group, Inc.
#a
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-activemq::default"

begin
  t = resources(:template => "#{node['vlg-activemq']['conf_dir']}/activemq.xml")
  t.source "activemq.xml.erb"
  t.cookbook "vlg-all-in-one"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-activemq']['conf_dir']}/activemq.xml to modify"
end
