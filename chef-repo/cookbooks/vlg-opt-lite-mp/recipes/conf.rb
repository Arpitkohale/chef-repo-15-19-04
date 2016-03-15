#
# Cookbook Name:: vlg-opt-lite-mp
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# setenv.sh template override
begin
  t = resources(:template => "#{node['vlg-tomcat']['bin_dir']}/setenv.sh")
  t.source "setenv.sh.erb"
  t.cookbook "vlg-opt-lite-mp"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-tomcat']['bin_dir']}/setenv.sh to modify"
end
