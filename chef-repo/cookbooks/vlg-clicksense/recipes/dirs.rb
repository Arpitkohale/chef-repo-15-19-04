#
# Cookbook Name:: vlg-clicksense
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
	       "#{node["vlg-clicksense"]["home_dir"]}",
	       "#{node["vlg-clicksense"]["local_dir"]}",
	       "#{node["vlg-clicksense"]["lib_dir"]}"
              ]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
    recursive true
  end
end
