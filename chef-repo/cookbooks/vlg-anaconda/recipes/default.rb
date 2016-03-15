#
# Cookbook Name:: vlg-anaconda
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-base::default"
include_recipe "anaconda::default"
include_recipe "anaconda::notebook_server"
include_recipe "anaconda::shell_conveniences"
#include_recipe "vlg-anaconda::psycopg2"
#include_recipe "vlg-anaconda::links"
