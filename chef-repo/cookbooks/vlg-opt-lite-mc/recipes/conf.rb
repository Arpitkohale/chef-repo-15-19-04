#
# Cookbook Name:: vlg-opt-lite-mc
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#
#

# memcached
template '/etc/sysconfig/memcached' do
  source 'memcached.erb'
  mode '0755'
  action :create
  notifies :restart, "service[memcached]", :delayed
end

# NRPE configs
if node.chef_environment == "production"
	nrpe_check "check_mem" do
	  command "#{node['vlg-base']['bin_dir']}/check_mem.sh #{node['vlg-opt']['nrpe']['check_mem']['warning']} #{node['vlg-opt']['nrpe']['check_mem']['critical']}"
	  action :add
	end
	nrpe_check "check_cpu" do
	  command "#{node['vlg-base']['bin_dir']}/check_cpu.sh -w #{node['vlg-opt']['nrpe']['check_cpu']['warning']} -c #{node['vlg-opt']['nrpe']['check_cpu']['critical']}"
	  action :add
	end
end