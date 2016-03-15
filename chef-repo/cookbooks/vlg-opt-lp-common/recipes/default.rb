#
# Cookbook Name:: vlg-opt-lp-common
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-lp-common::dirs"
include_recipe "vlg-opt-lp-common::conf"
