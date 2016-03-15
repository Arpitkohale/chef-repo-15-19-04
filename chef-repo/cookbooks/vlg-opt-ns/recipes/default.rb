#
# Cookbook Name:: vlg-opt-ns
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-ns::dirs"
include_recipe "vlg-opt-ns::conf"
