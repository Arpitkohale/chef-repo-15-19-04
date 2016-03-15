#
# Cookbook Name:: vlg-data-normalizer
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-s3cmd::default"
include_recipe "vlg-tomcat::default"
include_recipe "vlg-data-normalizer::dirs"
include_recipe "vlg-data-normalizer::providers"
include_recipe "vlg-data-normalizer::links"
unless Chef::Config[:solo]
  include_recipe "vlg-data-normalizer::repo"
end
if node.chef_environment == "production"
  include_recipe "vlg-data-normalizer::nrpe_checks"
end
