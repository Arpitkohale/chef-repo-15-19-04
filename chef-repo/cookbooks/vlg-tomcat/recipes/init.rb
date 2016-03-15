#
# Cookbook Name:: vlg-tomcat
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Tomcat init script configuration
template '/etc/init.d/tomcat' do
  source 'init.erb'
  mode '0755'
  action :create
  variables({
    :vlg_tomcat_user => node['vlg-tomcat']['user'],
    :vlg_tomcat_catalina_home => node['vlg-tomcat']['catalina_home'],
    :vlg_tomcat_catalina_base => node['vlg-tomcat']['catalina_base'],
    :vlg_tomcat_catalina_pid => node['vlg-tomcat']['catalina_pid']
  })
end

# Start on boot
service 'tomcat' do
  action [:enable]
end
