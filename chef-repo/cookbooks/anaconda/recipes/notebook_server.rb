#
# Cookbook Name:: anaconda
# Recipe:: notebook_server
#
# Copyright (C) 2014 Matt Chu
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'runit::default'

anaconda_nbservice 'notebook-server' do
  # listen on all interfaces; there will be a warning since security is
  # disabled
  ip "#{node['anaconda']['ip']}"
  port "#{node['anaconda']['port']}"
  user "#{node['anaconda']['owner']}"
  group "#{node['anaconda']['group']}"
  install_dir "#{node['anaconda']['instal_dir']}"
  profile "#{node['anaconda']['profile']}"
  service_action [ :enable, :start ]
end
