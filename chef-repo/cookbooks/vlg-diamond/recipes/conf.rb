#
# Cookbook Name:: vlg-diamond
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# diamond
template '/etc/diamond/diamond.conf' do
  source 'diamond.conf.erb'
  mode '0755'
  action :create
  notifies :run, "execute[restart_diamond]", :delayed
  only_if "hostname -f | grep -q inf.videologygroup.com"
end

execute "restart_diamond" do
  action :nothing
  command "/etc/init.d/diamond stop; /etc/init.d/diamond start"
end
