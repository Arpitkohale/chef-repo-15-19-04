#
# Cookbook Name:: vlg-opt-rp
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-rp::dirs"
include_recipe "vlg-opt-rp::conf"
