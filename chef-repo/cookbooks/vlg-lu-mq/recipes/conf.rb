#
# Cookbook Name:: vlg-lu-mq
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# activemq.xml template override
begin
  t = resources(:template => "#{node['vlg-activemq']['conf_dir']}/activemq.xml")
  t.source "activemq.xml.erb"
  t.cookbook "vlg-lu-mq"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-activemq']['conf_dir']}/activemq.xml to modify"
end
