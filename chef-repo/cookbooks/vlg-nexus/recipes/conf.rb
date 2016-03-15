#
# Cookbook Name:: vlg-nexus
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['vlg-nexus']['base_dir']}/sonatype-work/nexus/conf" do
  owner "#{node['vlg-nexus']['user']}"
  group "#{node['vlg-nexus']['group']}"
  mode "0755"
  action :create
  end

#template "#{node['vlg-nexus']['base_dir']}/sonatype-work/nexus/conf/security.xml" do
  #user "#{node['vlg-nexus']['user']}"
  #source 'security.xml.erb'
  #action :create
#end

#template "#{node['vlg-nexus']['base_dir']}/sonatype-work/nexus/conf/nexus.xml" do
  #user "#{node['vlg-nexus']['user']}"
  #source 'nexus.xml.erb'
  #action :create
#end

template "/etc/init.d/nexus" do
  user "root"
  source 'nexus_init_script.erb'
  mode "755"
  owner "root"
  group "root"
  action :create
end
