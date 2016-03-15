#
# Cookbook Name:: vlg-lz-se
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-tomcat::default"
include_recipe "vlg-lz-se::dirs"
include_recipe "vlg-lz-se::conf"
