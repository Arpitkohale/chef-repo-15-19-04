#
# Cookbook Name:: vlg-solr5
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-solr5::setup"
include_recipe "vlg-solr5::init"
include_recipe "vlg-solr5::conf"
