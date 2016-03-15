#
# Cookbook Name:: vlg-opt-lite-mo
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-lite-mo::dirs"
include_recipe "vlg-opt-lite-mo::conf"
