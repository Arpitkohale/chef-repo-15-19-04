#
# Cookbook Name:: vlg-lu-dm
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-lu-dm::dirs"
include_recipe "vlg-lu-dm::conf"
include_recipe "vlg-ssl::star_lucidmedia_com"
include_recipe "vlg-ssl::godaddy_bundle"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
end
