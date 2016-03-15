#
# Cookbook Name:: vlg-lz-pi
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
include_recipe "vlg-lz-pi::conf"
include_recipe "vlg-ssl::star_tidaltv_com"

