#
# Cookbook Name:: vlg-graphite
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# required pip packages
pip_packages = node['vlg-graphite']['python_pip_packages']

pip_packages.each do |pip_package_name|
  python_pip "#{pip_package_name}" do
    action :install
  end
end

# graphite
python_pip "Django" do
  version "1.4.14"
end

python_pip "whisper" do
  version "0.9.13"
end

python_pip "carbon" do
  version "0.9.13"
  not_if "test -d #{node['vlg-graphite']['home']}/lib/carbon"
end

python_pip "graphite-web" do
  version "0.9.13"
  not_if "test -d #{node['vlg-graphite']['home']}/webapp/graphite"
end

# carbon-c-relay
remote_file "#{Chef::Config[:file_cache_path]}/carbon-c-relay.rpm" do
  source "http://s3.amazonaws.com/videologypublic/repo/carbon-c-relay-0.40-2.x86_64.rpm"
  notifies :run, "execute[install_carbon_c_relay]", :immediately
  not_if "rpm -qa | grep -q carbon-c-relay"
end

execute "install_carbon_c_relay" do
  action :nothing
  command "rpm -ihv #{Chef::Config[:file_cache_path]}/carbon-c-relay.rpm && rm -rf #{Chef::Config[:file_cache_path]}/carbon-c-relay.rpm && chown #{node['vlg-graphite']['user']}:#{node['vlg-graphite']['user']} /var/log/carbon-c-relay /var/run/carbon-c-relay"
end

# grafana
package 'grafana' do
  action :install
  version node['vlg-graphite']['grafana']['version']
end

# seyren
remote_file node['vlg-graphite']['seyren']['location'] do
  source node['vlg-graphite']['seyren']['download']['url']
  not_if "test -f #{node['vlg-graphite']['seyren']['location']}"
end

# seyren.sh
template node['vlg-graphite']['seyren']['wrapper'] do
  source 'seyren.sh.erb'
  mode '0755'
  action :create
end
