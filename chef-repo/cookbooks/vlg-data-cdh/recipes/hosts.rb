#
# Cookbook Name:: vlg-data-cdh
# Recipe:: hosts
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

cdh_hosts = nil
case node.chef_environment
when "production"
  cdh_hosts = search(:node, "recipes:vlg-data-cdh AND chef_environment:production")
when "endtoend"
  cdh_hosts = search(:node, "recipes:vlg-data-cdh AND chef_environment:endtoend")
when "sandbox"
  cdh_hosts = search(:node, "recipes:vlg-data-cdh AND chef_environment:sandbox")
end

if cdh_hosts != nil
  cdh_hosts.sort!{|x, y| x[:machinename] <=> y[:machinename]}
end

if cdh_hosts != nil
  template '/etc/hosts' do
    source 'hosts.erb'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
    variables({
    :cdh_hosts => cdh_hosts
    })
  end
end
