#
# Cookbook Name:: vlg-rundeck
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file File.join(Chef::Config[:file_cache_path], node['vlg-rundeck']['package_file']) do
  source node['vlg-rundeck']['package_full_url']
  action :create_if_missing
end

yum_package File.join(Chef::Config[:file_cache_path], node['vlg-rundeck']['package_file'])

package "rundeck" do
  action :install
  notifies :run, "bash[fix_rundeck_permissions]", :immediately
end

bash "fix_rundeck_permissions" do
  user "root"
  code <<-EOH
    sed -i '/rundeck:/d' /etc/passwd /etc/group; mkdir /tmp/rundeck; chown #{node['vlg-rundeck']['user']}:#{node['vlg-rundeck']['user']} -R /var/lib/rundeck /var/rundeck/projects /etc/rundeck /var/log/rundeck /tmp/rundeck
  EOH
  action :nothing
end

directory '/tmp/rundeck' do
  owner "#{node['vlg-rundeck']['user']}"
  group "#{node['vlg-rundeck']['user']}"
  mode '0755'
end

template '/etc/init.d/rundeckd' do
  source 'rundeckd.init.erb'
  mode '0755'
  action :create
  notifies :restart, "service[rundeckd]", :delayed
end

services = [ 'rundeckd', ]
services.each do |service_name|
  service service_name do
    action [ :enable, :start]
  end
end
