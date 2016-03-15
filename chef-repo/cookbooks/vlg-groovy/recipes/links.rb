#
# Cookbook Name:: vlg-groovy
# Recipe:: links
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

link "/opt/groovy" do
  to node[:groovy][:home]
  link_type :symbolic
end
