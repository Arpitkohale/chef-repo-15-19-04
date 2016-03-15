#
# Cookbook Name:: vlg-lz-mq
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
  t.cookbook "vlg-lz-mq"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-activemq']['conf_dir']}/activemq.xml to modify"
end

# jetty.xml template override
begin
  t = resources(:template => "#{node['vlg-activemq']['conf_dir']}/jetty.xml")
  t.source "jetty.xml.erb"
  t.cookbook "vlg-lz-mq"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-activemq']['conf_dir']}/jetty.xml to modify"
end

#Woraround https://issues.apache.org/jira/browse/AMQ-5225
file "#{node['vlg-activemq']['home']}/lib/pax-url-aether-1.5.2.jar" do
  action :delete
end