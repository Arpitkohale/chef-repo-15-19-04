#
# Cookbook Name:: vlg-all-in-one
# Recipe:: storm
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-storm::default"
include_recipe "vlg-storm::supervisor"
