#
# Cookbook Name:: vlg-data-ftp
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-data-ftp::dirs"
include_recipe "vlg-data-ftp::users"
include_recipe "vlg-data-ftp::nrpe_checks"
include_recipe "vlg-ssl::godaddy_bundle"
include_recipe "vlg-ssl::star_videologygroup_com"
include_recipe "onddo_proftpd::default"
include_recipe "vlg-s3cmd::default"
