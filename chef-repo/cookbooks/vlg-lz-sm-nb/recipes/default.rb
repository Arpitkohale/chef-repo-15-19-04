#
# Cookbook Name:: vlg-lz-sm-nb
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-lz-sm::default"
include_recipe "vlg-storm::nimbus"
include_recipe "vlg-groovy::default"
#include_recipe "vlg-lz-sm-nb::export-cluster-metrics"
