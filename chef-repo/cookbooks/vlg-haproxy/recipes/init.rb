#
# Cookbook Name:: vlg-haproxy
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Start on boot
service 'haproxy' do
  action [:enable]
end
