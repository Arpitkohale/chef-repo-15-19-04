#
# Cookbook Name:: vlg-opt-dg
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# clicksense local dirs
directories = [
               "#{node["vlg-clicksense"]["local_dir"]}/conf",
               "#{node["vlg-clicksense"]["local_dir"]}/cache",
               "#{node["vlg-clicksense"]["local_dir"]}/logs",
               "#{node["vlg-clicksense"]["local_dir"]}/models"
              ]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
  end
end
