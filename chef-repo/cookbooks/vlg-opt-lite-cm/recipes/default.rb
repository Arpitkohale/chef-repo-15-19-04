#
# Cookbook Name:: vlg-opt-lite-cm
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-clicksense::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-opt-lite-cm::dirs"
include_recipe "vlg-opt-lite-cm::conf"
include_recipe "vlg-activemq::default"
