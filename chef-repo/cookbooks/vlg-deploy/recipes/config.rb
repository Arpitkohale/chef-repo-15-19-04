#
# Cookbook Name:: vlg-deploy
# Recipe:: config
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/ansible/ansible.cfg" do
	source "ansible.cfg.erb"
	mode '0644'
	owner 'root'
	group 'root'
end

data = Chef::EncryptedDataBagItem.load("nagios", "credentials")
template "#{node['vlg-base']['etc_dir']}/nagios.cfg" do
        source "nagios-creds.erb"
        mode '0400'
        owner node['vlg-base']['app_user']
        group node['vlg-base']['app_user']
	variables({
		:nagios_username => data['username'],
		:nagios_password => data['password']
  })
end
