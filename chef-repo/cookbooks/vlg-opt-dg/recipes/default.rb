#
# Cookbook Name:: vlg-opt-dg
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-dg::dirs"
include_recipe "vlg-opt-dg::conf"
