#
# Cookbook Name:: vlg-lz-di
# Recipe:: dd-config
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/dd-agent/conf.d/tomcat.yaml" do
	source "tomcat.yaml.erb"
	mode '0644'
	owner 'root'
	group 'root'
end
