#
# Cookbook Name:: vlg-graphite
# Recipe:: init
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# carbon-cache
template '/etc/init.d/carbon-cache' do
  source 'carbon-cache.init.erb'
  mode '0755'
  action :create
end

# uwsgi
template '/etc/init.d/uwsgi' do
  source 'uwsgi.init.erb'
  mode '0755'
  action :create
end

# seyren
template '/etc/init.d/seyren' do
  source 'seyren.init.erb'
  mode '0755'
  action :create
end
