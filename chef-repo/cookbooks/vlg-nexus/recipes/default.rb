#
# Cookbook Name:: vlg-nexus
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-nexus::setup"
include_recipe "vlg-nexus::conf"
include_recipe "vlg-nexus::http_config"
include_recipe "vlg-nexus::nexus_service"
