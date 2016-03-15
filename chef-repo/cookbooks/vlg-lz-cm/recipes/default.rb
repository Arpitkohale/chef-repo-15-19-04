#
# Cookbook Name:: vlg-lz-cm
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-tomcat::default"
include_recipe "vlg-lz-cm::dirs"
include_recipe "vlg-lz-cm::conf"
