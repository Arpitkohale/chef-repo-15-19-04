#
# Cookbook Name:: vlg-all-in-one
# Recipe:: mysql
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

mysql_service "default" do
  port "#{node["vlg-all-in-one"]["mysql_port"]}"
  version "#{node["vlg-all-in-one"]["mysql_version"]}"
  data_dir "#{node["vlg-all-in-one"]["mysql_data_dir"]}"
  bind_address "#{node["vlg-all-in-one"]["mysql_bind_address"]}"
  initial_root_password "#{node["vlg-all-in-one"]["mysql_root_password"]}"
  action [:create, :start]
  notifies :run, "bash[setup_mysql_users]", :delayed
end

bash "setup_mysql_users" do
  root_password = node['vlg-all-in-one']['mysql_root_password']
  user = node['vlg-all-in-one']['mysql_user']
  code <<-EOH
    nc -z -v -w 1 127.0.0.1 #{node["vlg-all-in-one"]["mysql_port"]} || exit 0
    mysql --user root --password="#{root_password}" --socket="/var/run/mysql-default/mysqld.sock" -e "CREATE USER '"#{user}"'@'%' IDENTIFIED BY '"#{user}"';"
    mysql --user root --password="#{root_password}" --socket="/var/run/mysql-default/mysqld.sock" -e "GRANT ALL PRIVILEGES ON *.* TO '"#{user}"'@'%';"
    mysql --user root --password="#{root_password}" --socket="/var/run/mysql-default/mysqld.sock" -e "CREATE USER '"#{user}"'@'localhost' IDENTIFIED BY '"#{user}"';"
    mysql --user root --password="#{root_password}" --socket="/var/run/mysql-default/mysqld.sock" -e "GRANT ALL PRIVILEGES ON *.* TO '"#{user}"'@'localhost';"
  EOH
  action :nothing
end

template "/etc/mysql-#{node['vlg-all-in-one']['mysql_service_name']}/conf.d/#{node['vlg-all-in-one']['mysql_service_name']}.cnf" do
  source "my.cnf.erb"
  owner "mysql"
  group "mysql"
  mode "0755"
  action :create
  only_if "test -d /etc/mysql-#{node['vlg-all-in-one']['mysql_service_name']}/conf.d"
end

template "#{node['vlg-base']['app_user_home']}/.my.cnf" do
  source "defaults-file.my.cnf.erb"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0600"
  action :create
end

link "/var/lib/mysql/mysql.sock" do
  to "/var/run/mysql-default/mysqld.sock"
end
