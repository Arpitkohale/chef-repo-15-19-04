#
# Cookbook Name:: vlg-bamboo-agent
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-bamboo-agent::dmp-repo"
include_recipe "vlg-all-in-one::default"
include_recipe "vlg-bamboo-agent::hosts"
include_recipe "vlg-bamboo-agent::haproxy"
include_recipe "vlg-bamboo-agent::agent"
include_recipe "vlg-bamboo-agent::services"
include_recipe "vlg-all-in-one::setup-local"
include_recipe "vlg-deploy::default"