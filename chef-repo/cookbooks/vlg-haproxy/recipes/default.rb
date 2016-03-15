#
# Cookbook Name:: vlg-haproxy
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-haproxy::setup"
include_recipe "vlg-haproxy::conf"
include_recipe "vlg-haproxy::init"
include_recipe "vlg-sysctl::high-tcp-performance"
