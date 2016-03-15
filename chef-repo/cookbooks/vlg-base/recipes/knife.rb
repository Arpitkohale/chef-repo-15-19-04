#
# Cookbook Name:: vlg-base
# Recipe:: knife
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/chef/knife.rb" do
        source "knife.erb"
        owner "root"
        group "root"
        mode "0600"
	action :create
end
