#
# Cookbook Name:: vlg-nexus
# Recipe:: nexus_service
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

service "nexus" do
  supports :restart => true, :start => true, :stop => true, :status => true
  action [:enable, :start]
end  
