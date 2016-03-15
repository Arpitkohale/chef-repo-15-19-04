#
# Cookbook Name:: vlg-solr5
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

ark 'solr' do
  url node['vlg-solr5']['download_url']
  version node['vlg-solr5']['version']
  path node['vlg-solr5']['install_dir']
  prefix_root node['vlg-solr5']['install_dir']
  prefix_home node['vlg-solr5']['install_dir']
  home_dir node['vlg-solr5']['home_dir']
  owner node['vlg-solr5']['user']
end
