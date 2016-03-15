#
# Cookbook Name:: vlg-ad-li
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-tomcat::default"
include_recipe "vlg-solr5::default"
include_recipe "vlg-ad-li::conf"
