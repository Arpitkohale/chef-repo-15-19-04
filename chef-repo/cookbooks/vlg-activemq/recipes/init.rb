#
# Cookbook Name:: vlg-activemq
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# activemq init script configuration
template '/etc/init.d/activemq' do
  source 'init.erb'
  mode '0755'
  action :create
  variables({
    :vlg_activemq_home => node['vlg-activemq']['home'],
    :vlg_activemq_user => node['vlg-activemq']['user'],
    :vlg_activemq_pid => node['vlg-activemq']['pid'],
    :vlg_activemq_base_dir=> node['vlg-activemq']['base_dir'],
    :vlg_activemq_data_dir=> node['vlg-activemq']['data_dir'],
    :vlg_activemq_tmp_dir => node['vlg-activemq']['tmp_dir'],
    :vlg_activemq_jvm_heap => node['vlg-activemq']['jvm_heap']
  })
end

# Start on boot
service 'activemq' do
  action [:enable]
end
