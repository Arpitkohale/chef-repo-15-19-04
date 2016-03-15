#
# Cookbook Name:: vlg-base
# Recipe:: timezone
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{node['vlg-base']['timezone']}"
  link_type :symbolic
  notifies :run, "execute[restart_crond]", :delayed
end

execute "restart_crond" do
  action :nothing
  command "/etc/init.d/crond restart"
end
