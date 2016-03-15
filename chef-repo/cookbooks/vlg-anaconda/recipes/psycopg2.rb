#
# Cookbook Name:: vlg-anaconda
# Recipe:: psycopg2
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['psycopg2']['download_url']

# Download and unpack
ark 'psycopg2' do
  url download_url
  version node['psycopg2']['version']
  path node['psycopg2']['install_dir']
  home_dir "#{node['psycopg2']['install_dir']}/psycopg2"
end

# Build it
bash "build_psycopg2" do
  user "root"
  cwd "#{node['psycopg2']['home_dir']}"
  code <<-EOH
    (cd "#{node['psycopg2']['home_dir']}"; python setup.py build)
  EOH
  action :nothing
end

# ODBC driver file in /etc/odbcinst.ini
template "#{node['psycopg2']['etc_dir']}/odbcinst.ini" do
  source "odbcinst.ini.erb"
  owner 'root'
  group 'root'
  action :create
end
