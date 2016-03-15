#
# Cookbook Name:: vlg-lz-jb
# Recipe:: ansiblemodules
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

package "MySQL-python" do
  action :remove
end

package "mysql-devel" do
  action :upgrade
end

python_pip "setuptools" do
  action :upgrade
end

python_pip "MySQL-python" do
  action :upgrade
end

python_pip "httplib2" do
  action :upgrade
end
