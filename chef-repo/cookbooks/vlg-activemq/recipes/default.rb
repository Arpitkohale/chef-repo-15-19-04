#
# Cookbook Name:: vlg-activemq
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-activemq::setup"
include_recipe "vlg-activemq::init"
include_recipe "vlg-activemq::dirs"
include_recipe "vlg-activemq::conf"
