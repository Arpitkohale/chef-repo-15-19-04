#
# Cookbook Name:: vlg-solr
# Recipe:: mysql-connector
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node['vlg-solr']['lib_dir']}/solr-dataimporthandler-4.10.2.jar" do
  source "http://s3.amazonaws.com/videologypublic/repo/solr-dataimporthandler-4.10.2.jar"
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
  mode   00644
  action :create
end

remote_file "#{node['vlg-solr']['lib_dir']}/mysql-connector-java-5.1.34-bin.jar" do
  source "http://s3.amazonaws.com/videologypublic/repo/mysql-connector-java-5.1.34-bin.jar"
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
  mode   00644
  action :create
end
