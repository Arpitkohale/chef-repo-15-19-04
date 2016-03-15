#
# Cookbook Name:: vlg-deploy
# Recipe:: pip
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

python_pip "ansible" do
  case node.chef_environment
  when "production"
    version "1.8.4"
  else
    version "1.9.2"
  end
end

pip_packages = node['vlg-deploy']['python_pip_packages']

pip_packages.each do |pip_package_name|
  python_pip "#{pip_package_name}" do
    action :install
  end
end
