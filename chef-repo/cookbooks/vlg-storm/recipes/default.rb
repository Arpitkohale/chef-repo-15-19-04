#
# Cookbook Name:: vlg-storm
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe "vlg-java::default"
include_recipe "vlg-storm::setup"
include_recipe "vlg-storm::dirs"
include_recipe "vlg-storm::conf"
#include_recipe "vlg-storm::storm-graphite"
