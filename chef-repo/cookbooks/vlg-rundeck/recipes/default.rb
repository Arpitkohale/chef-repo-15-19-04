#
# Cookbook Name:: vlg-rundeck
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-rundeck::db"
include_recipe "vlg-haproxy::default"
include_recipe "vlg-java::default"
include_recipe "vlg-rundeck::repo"
include_recipe "vlg-rundeck::setup"
include_recipe "vlg-rundeck::conf"
include_recipe "vlg-rundeck::dirs"
include_recipe "vlg-rundeck::unixODBC"
include_recipe "perl::default"
include_recipe "vlg-rundeck::cpan"
if node.chef_environment == "production"
  include_recipe "vlg-ssh-key::default"
  include_recipe "vlg-s3cmd::default"
end
if node.chef_environment == "endtoend"
  include_recipe "vlg-ssh-key::default"
  include_recipe "vlg-s3cmd::default"
end
if node.chef_environment == "sandbox"
  include_recipe "vlg-ssh-key::default"
  include_recipe "vlg-s3cmd::default"
end
include_recipe "vlg-rundeck::pip"
include_recipe "vlg-rundeck::repo"
include_recipe "vlg-parallel::default"
include_recipe "vlg-groovy::default"
include_recipe "vlg-rundeck::keys"
include_recipe "vlg-deploy::dirs"
include_recipe "vlg-deploy::config"
include_recipe "vlg-deploy::ansible-playbooks"
include_recipe "vlg-rundeck::winrm"
include_recipe "vlg-rundeck::appdev"
