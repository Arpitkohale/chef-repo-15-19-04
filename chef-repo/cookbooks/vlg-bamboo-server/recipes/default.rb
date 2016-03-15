	#
# Cookbook Name:: vlg-bamboo-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "bamboo::server"
include_recipe "vlg-s3cmd::default"
include_recipe "vlg-bamboo-server::bamboo_cron"