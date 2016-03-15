#
# Cookbook Name:: vlg-log
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-s3cmd::default"
include_recipe "vlg-s3fs::default"
include_recipe "vlg-log::dirs"
#include_recipe "vlg-log::mount"
