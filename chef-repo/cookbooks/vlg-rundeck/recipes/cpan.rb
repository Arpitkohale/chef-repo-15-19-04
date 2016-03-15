#
# Cookbook Name:: vlg-rundeck
# Recipe:: capn
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

cpan_packages = node['vlg-rundeck']['cpan_modules']

cpan_packages.each do |cpan_packages_name|
  cpan_module "#{cpan_packages_name}" do
    force true
  end
end