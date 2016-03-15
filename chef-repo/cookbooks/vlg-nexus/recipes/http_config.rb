#
# Cookbook Name:: vlg-nexus
# Recipe:: http_config
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['vlg-nexus']['httpd_conf']}" do
  owner "root"
  group "root"
  mode "0755" 
  action :create
  end

template "#{node['vlg-nexus']['httpd_conf']}/nexus.videologygroup.com.conf" do
  source 'nexus.videologygroup.com.conf.erb'
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :restart, "service[httpd]", :immediately
 end

service "httpd" do
  supports :restart => true, :reload => true
  action :enable
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  action :create
end
