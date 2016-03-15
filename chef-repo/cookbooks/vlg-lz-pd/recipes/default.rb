#
# Cookbook Name:: vlg-lz-pd
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::default"
include_recipe "vlg-lz-pd::conf"
