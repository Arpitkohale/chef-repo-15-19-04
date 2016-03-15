#
# Cookbook Name:: vlg-zookeeper
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-zookeeper::setup"
include_recipe "vlg-zookeeper::dirs"
include_recipe "vlg-zookeeper::conf"
include_recipe "vlg-zookeeper::init"
