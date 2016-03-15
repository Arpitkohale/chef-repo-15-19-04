#
# Cookbook Name:: vlg-bamboo-agent
# Recipe:: agent
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['vlg-bamboo-agent']['home']}" do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
  only_if "test -d /data"
end

directory "#{node['vlg-bamboo-agent']['home']}/tmp" do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
  only_if "test -d #{node['vlg-bamboo-agent']['home']}"
end

directory "#{node['vlg-bamboo-agent']['home']}/conf" do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode "0755"
  recursive true
  only_if "test -d #{node['vlg-bamboo-agent']['home']}"
end

remote_file "#{Chef::Config[:file_cache_path]}/#{node['vlg-bamboo-agent']['installer']['file']}" do
  source node['vlg-bamboo-agent']['installer']['url']
  not_if "test -f #{node['vlg-bamboo-agent']['home']}/bin/bamboo-agent.sh"
  notifies :run, "bash[install_bamboo_agent]", :immediately
end

bash "install_bamboo_agent" do
  user "#{node['vlg-base']['app_user']}"
  code <<-EOH
  java -Dbamboo.home=#{node['vlg-bamboo-agent']['home']} -jar #{Chef::Config[:file_cache_path]}/#{node['vlg-bamboo-agent']['installer']['file']} #{node['vlg-bamboo-server']['url']}/agentServer install
cat << EOF > #{node['vlg-bamboo-agent']['home']}/bamboo-agent.cfg.xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<configuration>
<buildWorkingDirectory>#{node['vlg-bamboo-agent']['home']}/xml-data/build-dir</buildWorkingDirectory>
<agentDefinition>
<name>#{node.name}</name>
</agentDefinition>
</configuration>
EOF
  EOH
  action :nothing
end

template "#{node['vlg-bamboo-agent']['home']}/conf/wrapper.conf" do
  source "bamboo-agent-wrapper.conf.erb"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0644"
  action :create
end

template "/etc/init.d/bamboo-agent" do
  source "bamboo-agent-init.erb"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  mode "0755"
  action :create
end
