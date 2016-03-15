#
# Cookbook Name:: vlg-kafka
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/init.d/kafka-mirror' do
  source 'init-mirror.erb'
  mode '0755'
  action :create
end

# Start on boot
service 'kafka-mirror' do
  action [:enable]
end