#
# Cookbook Name:: vlg-lu-rh
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

unless Chef::Config[:solo]
  include_recipe "vlg-s3cmd::default"
  include_recipe "vlg-diamond::default"
  include_recipe "vlg-lu-rh::numpy"
  include_recipe "vlg-lu-rh::aws"
  include_recipe "vlg-lu-rh::chef-cleanup"
  include_recipe "vlg-ssl::star_lucidmedia_com"
  include_recipe "vlg-ssl::star_tidaltv_com"
end
include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-lu-rh::dirs"
include_recipe "vlg-lu-rh::conf"
