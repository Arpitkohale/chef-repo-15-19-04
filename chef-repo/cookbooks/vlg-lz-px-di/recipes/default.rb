#
# Cookbook Name:: vlg-lz-px-da
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
include_recipe "vlg-lz-px-di::conf"
include_recipe "vlg-lz-px-di::aws-tagging"