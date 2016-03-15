#
# Cookbook Name:: vlg-lz-da
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# setenv.sh template override
results = Array.new

search(:node, "recipes:vlg-lz-pd" ).each do |n|
  h =  n.send(:"vlg-lz-pd")
  results << h.da_backend
end

node.default['vlg-lz-da']['is_lucy_cluster'] = results.uniq.flatten.include?(node.fqdn.to_s)

begin
  t = resources(:template => "#{node['vlg-tomcat']['bin_dir']}/setenv.sh")
  t.source "setenv.sh.erb"
  t.cookbook "vlg-lz-da"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "Could not find template #{node['vlg-tomcat']['bin_dir']}/setenv.sh to modify"
end
