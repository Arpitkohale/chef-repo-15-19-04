#
# Cookbook Name:: vlg-lz-da
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# clicksense logs dirs
directories = [
    "#{node["vlg-base"]["app_user_home"]}/ClickSense",
    "#{node["vlg-base"]["app_user_home"]}/ClickSense/local",
    "#{node["vlg-base"]["app_user_home"]}/ClickSense/local/logs"
]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
  end
end