#
# Cookbook Name:: vlg-opt-mq
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-base::default"
include_recipe "vlg-activemq::default"
include_recipe "vlg-opt-mq::conf"
