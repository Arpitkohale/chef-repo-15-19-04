#
# Cookbook Name:: vlg-nexus
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-nexus']['download_url']

directory "/usr/local/Nexus" do
	owner node['vlg-nexus']['user'] 
	group node['vlg-nexus']['group']
	mode '0755'
	action :create
end

# Download and unpack
ark 'sonatype-nexus' do
  url download_url
  version node['vlg-nexus']['version']
  owner node['vlg-nexus']['user']
  group node['vlg-nexus']['group']  
  path node['vlg-nexus']['base_dir']
  action :dump
end

link "#{node['vlg-nexus']['home']}/nexus" do
to "#{node['vlg-nexus']['link_dir_path']}"
 not_if do ::File.exists?("#{node['vlg-nexus']['home']}/nexus") end
end
