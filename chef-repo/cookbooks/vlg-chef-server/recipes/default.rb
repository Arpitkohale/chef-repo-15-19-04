#
# Cookbook Name:: vlg-chef-server
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute

include_recipe "vlg-ssl::godaddy_bundle"
include_recipe "vlg-ssl::star_videologygroup_com"
include_recipe "vlg-chef-server::config"
include_recipe "vlg-chef-server::services"
