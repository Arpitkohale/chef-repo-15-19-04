#
# Cookbook Name:: vlg-opt-lite-gw2
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# setenv.sh template override
begin
  t = resources(:template => "#{node['vlg-tomcat']['bin_dir']}/setenv.sh")
  t.source "setenv.sh.erb"
  t.cookbook "vlg-opt-lite-gw2"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-tomcat']['bin_dir']}/setenv.sh to modify"
end
