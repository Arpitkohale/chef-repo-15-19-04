#
# Cookbook Name:: vlg-all-in-one
# Recipe:: maven
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-all-in-one']['maven']['data_dir'] do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
end

link "#{node['vlg-base']['app_user_home']}/.m2" do
  to node['vlg-all-in-one']['maven']['data_dir']
end

include_recipe "maven::default"

link "/usr/local/bin/mvn" do
  to "/usr/local/maven/bin/mvn"
end

link "/usr/local/bin/mvnDebug" do
  to "/usr/local/maven/bin/mvnDebug"
end

link "/usr/local/bin/mvnyjp" do
  to "/usr/local/maven/bin/mvnyjp"
end

template "#{node['vlg-all-in-one']['maven']['data_dir']}/settings.xml" do
  source "maven-settings.xml.erb"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0600"
  action :create
end
