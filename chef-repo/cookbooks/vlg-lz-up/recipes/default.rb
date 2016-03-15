#
# Cookbook Name:: vlg-lz-up
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

case node.chef_environment
when "production"
include_recipe "vlg-ssl::star_videologygroup_com"
when "sandbox"
include_recipe "vlg-ssl::star_qa_videologygroup_com"
end
include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-s3cmd::default"
include_recipe "vlg-lz-up::dirs"
include_recipe "vlg-lz-up::conf"
