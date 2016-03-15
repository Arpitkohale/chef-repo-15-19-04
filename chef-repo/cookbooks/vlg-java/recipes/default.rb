#
# Cookbook Name:: vlg-java
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java::default"
include_recipe "vlg-java::unlimited-jce-policy"
