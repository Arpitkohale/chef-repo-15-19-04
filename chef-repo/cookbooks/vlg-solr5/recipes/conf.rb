#
# Cookbook Name:: vlg-solr5
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# solr.in.sh
template "#{node['vlg-solr5']['home_dir']}/bin/solr.in.sh" do
  source 'solr.in.sh.erb'
  mode '0755'
  action :create
end
