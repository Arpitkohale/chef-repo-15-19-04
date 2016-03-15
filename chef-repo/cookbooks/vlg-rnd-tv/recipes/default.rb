#
# Cookbook Name:: vlg-rnd-tv
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "vlg-base::default"
include_recipe "vlg-anaconda::default"
include_recipe "vlg-java::default"
include_recipe "scala::default"
include_recipe "vlg-s3cmd::default"
