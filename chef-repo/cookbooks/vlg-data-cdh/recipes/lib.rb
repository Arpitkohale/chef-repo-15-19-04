#
# Cookbook Name:: vlg-data-cdh
# Recipe:: lib
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-data-cdh']['lib_dir'] do
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
end

if node['vlg-data-cdh']['lib_sync'] == true
  remote_file "#{node['vlg-data-cdh']['lib_dir']}/crunch-lib-1.2.6.jar" do
    source "http://nexus.videologygroup.com/nexus/content/repositories/reporting/com/videologygroup/crunch/crunch-lib/1.2.6/crunch-lib-1.2.6.jar"
    owner node['vlg-base']['app_user']
    group node['vlg-base']['app_user']
    checksum '2773e79c94e55cdd71384e1904291051408c84d1d1d043573f0a434cea660210'
    action :create
  end

  remote_file "#{node['vlg-data-cdh']['lib_dir']}/schemas-1.2.7.jar" do
    source "http://nexus.videologygroup.com/nexus/content/repositories/reporting/com/videologygroup/avro/schemas/1.2.7/schemas-1.2.7.jar"
    owner node['vlg-base']['app_user']
    group node['vlg-base']['app_user']
    checksum '6585aebcdd6e1eed136ab414bb8c2884529528f876c2b718e9595ca96ba0df5f'
    action :create
  end
end
