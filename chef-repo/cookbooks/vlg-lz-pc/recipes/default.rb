# Cookbook Name:: vlg-lz-pi
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-lz-pc::setup"
include_recipe "vlg-lz-pc::conf"
include_recipe "vlg-ssl::star_videologygroup_com"
include_recipe "vlg-ssl::star_qa_videologygroup_com"
