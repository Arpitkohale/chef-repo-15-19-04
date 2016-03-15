#
# Cookbook Name:: vlg-base
# Recipe:: ohai
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

roles = node[:roles]
ohai_roles = ""
roles.each do |role|
  if ohai_roles != ""
    ohai_roles = "#{ohai_roles}" + " #{role}"
  else
    ohai_roles = "#{role}"
  end
end

template "#{node['vlg-base']['etc_dir']}/ohai.cfg" do
        source "ohai.cfg.erb"
        owner "root"
        group "root"
        mode "0644"
	action :create
        variables({
              :roles => "#{ohai_roles}",
              :location => "#{node['vlg-base']['location']}",
	      environment: node.chef_environment
        })
end
