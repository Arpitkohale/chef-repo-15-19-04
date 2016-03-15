#
# Cookbook Name:: vlg-rundeck
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# rundeck-config.properties
template '/etc/rundeck/rundeck-config.properties' do
  source 'rundeck-config.properties.erb'
  mode '0644'
  action :create
  notifies :restart, "service[rundeckd]", :delayed
end

# framework.properties
template '/etc/rundeck/framework.properties' do
  source 'framework.properties.erb'
  mode '0644'
  action :create
  notifies :restart, "service[rundeckd]", :delayed
end

# realm.properties
rundeck_users = data_bag_item("rundeck", "users")
template '/etc/rundeck/realm.properties' do
  source 'realm.properties.erb'
  mode '0644'
  action :create
  variables :rundeck_users => rundeck_users
end

# profile
template '/etc/rundeck/profile' do
  source 'profile.erb'
  mode '0644'
  action :create
  notifies :restart, "service[rundeckd]", :delayed
end

# haproxy.cfg template override
begin
  t = resources(:template => "#{node['vlg-haproxy']['etc_dir']}/haproxy.cfg")
  t.source "haproxy.cfg.erb"
  t.cookbook "vlg-rundeck"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-haproxy']['etc_dir']}/haproxy.cfg to modify"
end

# grapeConfig
template "#{node['vlg-rundeck']['user']}/.groovy/grapeConfig.xml" do
  source 'grapeConfig.xml.erb'
  mode '0644'
  action :create
  only_if "test -d #{node['vlg-rundeck']['user']}/.groovy"
end

# java_opts.sh
template '/etc/profile.d/java_opts.sh' do
  source 'java_opts.sh.erb'
  mode '0755'
  action :create
end
