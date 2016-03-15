#
# Cookbook Name:: vlg-base
# Recipe:: cron
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

package "cronie" do
  action :install
end
service 'crond' do
  action [:enable, :start]
end
