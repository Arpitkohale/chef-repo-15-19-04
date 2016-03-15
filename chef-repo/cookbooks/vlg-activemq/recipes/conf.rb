#
# Cookbook Name:: vlg-activemq
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# I didn't create a very sophisticated activemq.xml template because the configuration can get a bit complex depending on what you want out of activemq... It's easier to just dist static activemq.xml
# files out according to platform. In order to do this you have to override the activemq.xml template in your platform wrapper cookbook. See the 'vlg-lu-mq::conf' recipe for an example.
# -jp
template "#{node['vlg-activemq']['conf_dir']}/activemq.xml" do
  source "activemq.xml.erb"
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode "0755"
  action :create
end

template "#{node['vlg-activemq']['conf_dir']}/jetty.xml" do
  source 'jetty.xml.erb'
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode '0755'
  action :create
  variables({
    :vlg_activemq_jetty_port => node['vlg-activemq']['jetty']['port']
  })
end

template "#{node['vlg-activemq']['conf_dir']}/login.conf" do
  source "login.conf.erb"
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode "0755"
  action :create
end

template "#{node['vlg-activemq']['conf_dir']}/credentials.properties" do
  source "credentials.properties.erb"
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode "0755"
  action :create
end

template "#{node['vlg-activemq']['conf_dir']}/log4j.properties" do
  source "log4j.properties.erb"
  owner node['vlg-activemq']['user']
  group node['vlg-activemq']['group']
  mode "0755"
  action :create
end
