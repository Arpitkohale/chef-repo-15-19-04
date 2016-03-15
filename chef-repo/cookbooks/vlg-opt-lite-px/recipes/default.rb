#
# Cookbook Name:: vlg-opt-lite-px
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
include_recipe "vlg-opt-lite-px::conf"
