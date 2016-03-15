#
# Cookbook Name:: vlg-ad-tv
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "maven::default"
include_recipe "vlg-ad-tv::dirs"
include_recipe "vlg-ad-tv::repo"
