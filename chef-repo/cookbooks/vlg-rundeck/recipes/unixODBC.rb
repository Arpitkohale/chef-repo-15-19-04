#
# Cookbook Name:: vlg-rundeck
# Recipe:: unixODBC
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

%w{unixODBC unixODBC-devel python-devel gcc-c++ gcc unzip}.each do |pkg|
  package pkg do
    action :install
  end
end

packageNm='pyodbc-3.0.7'

remote_file "#{Chef::Config[:file_cache_path]}/#{packageNm}.zip" do
  action :create
  mode '0644'
  source "#{node['vlg-rundeck']['s3_pkg_url']}/#{packageNm}.zip"
  checksum 'd8355f2d43b10386070e8564aa973119fdb6e10864e1bbd73f3224cd3baab351'
  notifies :run, 'execute[unzip_pyodbc]', :immediately
  notifies :run, 'execute[setup_pyodbc]', :immediately
end

execute 'unzip_pyodbc' do
    cwd "#{Chef::Config[:file_cache_path]}"
    command "unzip #{packageNm}.zip -d /tmp"
    action :nothing
end

execute 'setup_pyodbc' do
    cwd "/tmp/#{packageNm}"
    command 'python setup.py build install'
    action :nothing
end

remote_file "#{Chef::Config[:file_cache_path]}/freetds-patched.tar.gz" do
  owner 'root'
  group 'root'
  mode '0644'
  source "#{node['vlg-rundeck']['s3_pkg_url']}/freetds-patched.tar.gz"
  checksum '4c847f0c43734489ffc6ea8c5eb66e2a24e7a1ba4287acd24b2950f8b2eb7590'
  notifies :run, 'execute[unzip_FreeTDS]', :immediately
end

execute 'unzip_FreeTDS' do
    cwd "#{Chef::Config[:file_cache_path]}"
    command "tar zxvf freetds-patched.tar.gz -C /tmp"
    action :nothing
end

bash 'setup_FreeTDS' do
  user 'root'
  code <<-EOH
  cd /tmp/freetds-*
  ./configure --prefix=/usr --sysconfdir=/etc --with-tdsver=8.0 --enable-msdblib
  make
  make install
  EOH
  action :run
  not_if 'test -a /etc/freetds.conf'
end

template '/etc/odbc.ini' do
  source 'odbc.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/odbcinst.ini' do
  source 'odbcinst.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/freetds.conf' do
  source 'freetds.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end