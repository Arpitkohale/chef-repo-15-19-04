#
# Cookbook Name:: vlg-datadog
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "datadog::dd-agent"
datadog_tags = ""
environment = node.chef_environment
node[:roles].each do |role|
  if datadog_tags == ""
    datadog_tags = "#{role}-#{node['vlg-base']['location']}-#{environment}"
  else
    datadog_tags = "#{datadog_tags}, #{role}-#{node['vlg-base']['location']}-#{environment}"
  end
end
node.default['datadog']['tags'] = "#{datadog_tags}"
