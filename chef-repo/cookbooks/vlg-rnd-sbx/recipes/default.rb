#
# Cookbook Name:: vlg-rnd-sbx
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "vlg-base::default"
include_recipe "vlg-anaconda::default"
include_recipe "vlg-java::default"
include_recipe "scala::default"
include_recipe "vlg-rnd-sbx::unixODBC"
include_recipe "vlg-rnd-sbx::conf"