#
# Cookbook Name:: vlg-opt-lite-da
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-lite-da::dirs"
include_recipe "vlg-opt-lite-da::conf"
