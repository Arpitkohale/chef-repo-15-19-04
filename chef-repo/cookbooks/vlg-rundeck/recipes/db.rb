#
# Cookbook Name:: vlg-rundeck
# Recipe:: db
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment != "production"
  mysql_service node['vlg-rundeck']['mysql']['name'] do
    port node['vlg-rundeck']['mysql']['port']
    version node['vlg-rundeck']['mysql']['version']
    bind_address node['vlg-rundeck']['mysql']['bind_address']
    initial_root_password node['vlg-rundeck']['mysql']['password']
    action [:create, :start]
  end

  template node['vlg-base']['app_user_home'] + '/.my.cnf' do
    source "defaults-file.my.cnf.erb"
    owner node['vlg-base']['app_user']
    group node['vlg-base']['app_user']
    mode '0600'
    action :create
    notifies :run, "execute[create_rundeck_db]", :immediately
  end

  execute "create_rundeck_db" do
    action :nothing
    command "mysql --user=#{node['vlg-rundeck']['mysql']['username']} --password=#{node['vlg-rundeck']['mysql']['password']} --socket=/var/run/mysql-#{node['vlg-rundeck']['mysql']['name']}/mysqld.sock -e 'create database if not exists rundeck;'"
  end
end
