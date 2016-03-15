#
# Cookbook Name:: vlg-ad-tv
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directories = [ "#{node['vlg-base']['app_user_home']}/nielsenIngest",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer/complete",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer/failed",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer/processing",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer/ready",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/importer/unknown",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter/complete",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter/failed",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter/processing",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter/ready",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/splitter/unknown",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/linkagePuller",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/linkagePuller/processing",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/linkagePuller/complete",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/linkagePuller/failed",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/aedPuller",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/aedPuller/processing",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/aedPuller/complete",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/aedPuller/failed",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/amrldPuller",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/amrldPuller/processing",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/amrldPuller/complete",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/amrldPuller/failed",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/logs",
				"#{node['vlg-base']['app_user_home']}/nielsenIngest/codebase"
]
directories.each do |directory_name|
  directory directory_name do
    owner node['vlg-base']['app_user']
    group node['vlg-base']['app_user']
    mode '0775'
    action :create
  end
end
