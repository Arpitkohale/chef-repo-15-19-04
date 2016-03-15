#
# Cookbook Name:: vlg-lz-pd
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-lz-pe::setup"
include_recipe "vlg-lz-pe::conf"
include_recipe "vlg-sysctl::high-tcp-performance"
include_recipe "vlg-ssl::star_tidaltv_com"
include_recipe "vlg-ssl::star_cmrdr_com"
