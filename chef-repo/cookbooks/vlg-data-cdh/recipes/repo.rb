#
# Cookbook Name:: vlg-data-cdh
# Recipe:: repo
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'cloudera-manager' do
  description "Cloudera Manager, Version #{node['vlg-data-cdh']['cloudera']['version']}"
  baseurl "http://archive.cloudera.com/cm5/redhat/6/x86_64/cm/#{node['vlg-data-cdh']['cloudera']['version']}/"
  gpgkey 'http://archive.cloudera.com/redhat/cdh/RPM-GPG-KEY-cloudera'
  action :create
end

yum_package 'oracle-j2sdk1.7' do
  version '1.7.0+update67-1'
end
