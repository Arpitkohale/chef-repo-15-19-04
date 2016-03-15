#
# Cookbook Name:: vlg-lz-da
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-tomcat::default"
include_recipe "vlg-s3cmd::default"
include_recipe "vlg-lz-da::dirs"
include_recipe "vlg-lz-da::conf"
include_recipe "vlg-lz-da::aws-tagging"
