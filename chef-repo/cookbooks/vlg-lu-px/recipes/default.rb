#
# Cookbook Name:: vlg-lu-px
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
  include_recipe "vlg-ssl::star_tidaltv_com"
  include_recipe "vlg-ssl::star_lucidmedia_com"
end
include_recipe "vlg-lu-px::conf"
