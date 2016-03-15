#
# Cookbook Name:: vlg-kafka
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-kafka::setup"
include_recipe "vlg-kafka::dirs"
include_recipe "vlg-kafka::conf"
include_recipe "vlg-kafka::init"

case node.chef_environment
  when "sandbox"
    include_recipe "vlg-kafka::kafka-graphite"
end
