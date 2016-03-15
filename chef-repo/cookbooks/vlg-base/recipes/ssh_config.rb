#
# Cookbook Name:: vlg-base
# Recipe:: ssh_config
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "#{node['vlg-base']['app_user_home']}/.ssh/config" do
        source "ssh_config.erb"
        owner "#{node['vlg-base']['app_user']}"
        group "#{node['vlg-base']['app_user']}"
        mode "0755"
	action :create
	only_if "test -d #{node['vlg-base']['app_user_home']}/.ssh"
end
