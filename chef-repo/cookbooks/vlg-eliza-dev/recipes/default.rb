#
# Cookbook Name:: vlg-eliza-dev
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-all-in-one::default"
include_recipe "vlg-eliza-dev::solr-config"
include_recipe "vlg-eliza-dev::create-schema"
include_recipe "vlg-eliza-dev::services"
include_recipe "vlg-all-in-one::setup-local"