#
# Cookbook Name:: vlg-zookeeper
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Tomcat init script configuration
template '/etc/init.d/zookeeper' do
  source 'init.erb'
  mode '0755'
  action :create
end

# Start on boot
service 'zookeeper' do
  action [:enable]
end

# Start
case node['vlg-base']['location']
  when "vagrant"
    service 'zookeeper' do
      action [:start]
    end
end
