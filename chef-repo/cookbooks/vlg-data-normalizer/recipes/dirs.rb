#
# Cookbook Name:: vlg-data-normalizer
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-data-normalizer']['data_root'] do
  owner 'root'
  group node['vlg-base']['app_user']
  mode '0750'
  action :create
end

directory node['vlg-data-normalizer']['provider_root'] do
  owner 'root'
  group node['vlg-base']['app_user']
  mode '0750'
  action :create
end

directories = [
	       "#{node['vlg-base']['log_dir']}/dt-nl-s3-backup",
	       "#{node['vlg-base']['log_dir']}/dt-nl-s3-nl",
	       "#{node['vlg-base']['log_dir']}/dt-nl-s3-nl-logs",
	       "#{node['vlg-base']['log_dir']}/dt-nl-s3-puller-exelate",
	       "#{node['vlg-base']['log_dir']}/dt-nl-s3-puller-turbine",
	       "#{node['vlg-base']['log_dir']}/dt-nl-bad-files",
	       "#{node['vlg-base']['log_dir']}/dt-nl-fte-nl",
	       "#{node['vlg-base']['log_dir']}/dt-nl-stale-check",
	       "#{node['vlg-data-normalizer']['normalizer_output']}"
              ]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
    recursive true
  end
end
