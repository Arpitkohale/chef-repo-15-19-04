#
# Cookbook Name:: vlg-solr
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-solr::dirs"
include_recipe "vlg-solr::setup"

