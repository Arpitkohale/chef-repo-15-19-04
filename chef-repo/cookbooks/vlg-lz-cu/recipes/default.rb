#
# Cookbook Name:: vlg-lz-cu
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
case node.chef_environment
  when "production"
    include_recipe "vlg-ssl::star_tidaltv_com"
    include_recipe "vlg-ssl::star_lucidmedia_com"
    include_recipe "vlg-ssl::star_videologygroup_com"
    include_recipe "vlg-s3cmd::default"
  when "sandbox"
    include_recipe "vlg-ssl::star_qa_videologygroup_com"
    include_recipe "vlg-s3cmd::default"
end
include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-lz-cu::dirs"
include_recipe "vlg-lz-cu::conf"