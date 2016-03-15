#
# Cookbook Name:: vlg-gams
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

ark 'gams' do
  url node['vlg-gams']['download_url']
  version node['vlg-gams']['version']
  path node['vlg-gams']['install_dir']
  home_dir "#{node['vlg-gams']['install_dir']}/gams"
end
