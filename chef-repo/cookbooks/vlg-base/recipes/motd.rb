#
# Cookbook Name:: vlg-base
# Recipe:: motd
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/motd" do
        source "motd.erb"
        owner "root"
        group "root"
        mode "0755"
	action :create
        variables({
              :arch => "#{node[:kernel][:os]} #{node[:kernel][:release]} #{node[:kernel][:version]}",
              :fqdn => "#{node[:fqdn]}",
              :roles => "#{node[:roles]}",
    	      environment: node.chef_environment
        })
end
