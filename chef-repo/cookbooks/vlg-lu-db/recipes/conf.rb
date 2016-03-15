#
# Cookbook Name:: vlg-lu-db
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# custom mysql server cnf
# NOTE: This template push does NOT automatically restart mysql when the cnf is created/updated. I think database restarts should be manual.
# -jp
template "/etc/mysql-#{node['vlg-lu-db']['mysql_service_name']}/conf.d/#{node['vlg-lu-db']['mysql_service_name']}.cnf" do
  source "my.cnf.erb"
  owner "mysql"
  group "mysql"
  mode "0755"
  action :create
  only_if "test -d /etc/mysql-#{node['vlg-lu-db']['mysql_service_name']}/conf.d"
end

# mysql defaults file
template "#{node['vlg-base']['app_user_home']}/.my.cnf" do
  source "defaults-file.my.cnf.erb"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0600"
  action :create
end
