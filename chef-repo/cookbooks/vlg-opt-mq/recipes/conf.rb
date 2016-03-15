#
# Cookbook Name:: vlg-opt-mq
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# activemq.xml template override

include_recipe "vlg-activemq::conf"

begin
  override = resources(:template => "#{node['vlg-activemq']['conf_dir']}/activemq.xml")
  override.source "activemq.xml.erb"
  override.cookbook "vlg-opt-mq"
  override.mode "0755"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-activemq']['conf_dir']}/activemq.xml to modify"
end

template "#{node['vlg-opt-mq']['conf_dir']}/activemq.xml" do
  source "activemq.xml.erb"
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode "0755"
  action :create
end
