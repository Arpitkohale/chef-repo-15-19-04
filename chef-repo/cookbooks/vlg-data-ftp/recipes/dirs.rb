#
# Cookbook Name:: vlg-data-ftp
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#


directory node['vlg-data-ftp']['data_root'] do
  owner 'root'
  group node['vlg-base']['app_user']
  mode '0750'
  action :create
end

directory node['vlg-data-ftp']['ftp_root'] do
  owner 'root'
  group node['vlg-base']['app_user']
  mode '0750'
  action :create
end

directory "#{node['vlg-base']['log_dir']}/doubleverify-ftp-upload-to-s3" do
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
end

directory "#{node['vlg-base']['log_dir']}/liverampm-ftp-upload-to-s3" do
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
end
