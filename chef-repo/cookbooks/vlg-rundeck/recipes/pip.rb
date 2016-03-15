#
# Cookbook Name:: vlg-rundeck
# Recipe:: pip
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

pip_packages = node['vlg-rundeck']['python_pip_packages']

pip_packages.each do |pip_package_name|
  python_pip "#{pip_package_name}" do
    action :install
  end
end
