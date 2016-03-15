#
# Cookbook Name:: vlg-solr5
# Recipe:: init
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/init.d/solr' do
  source 'solr-init.erb'
  mode '0755'
  action :create
end

service 'solr' do
  action [ :enable ]
end
