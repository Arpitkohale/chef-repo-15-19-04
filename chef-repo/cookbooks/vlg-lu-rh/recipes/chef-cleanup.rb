#
# Cookbook Name:: vlg-lu-rh
# Recipe:: chef-cleanup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# remove ourself from chef on shutdown
template "/etc/init.d/chef-cleanup" do
        source "chef-cleanup.erb"
        owner "root"
        group "root"
        mode "0755"
        action :create
end

link "/etc/rc0.d/K00chef-cleanup" do
  to "/etc/init.d/chef-cleanup"
  only_if "test -f /etc/init.d/chef-cleanup"
end

file "/var/lock/subsys/chef-cleanup" do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
