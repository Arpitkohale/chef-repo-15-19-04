#
# Cookbook Name:: vlg-deploy
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-ssh-key::default"
include_recipe "vlg-deploy::dirs"
include_recipe "vlg-deploy::ansible-playbooks"
include_recipe "python::default"
include_recipe "vlg-deploy::pip"
include_recipe "vlg-deploy::config"
include_recipe "vlg-java::default"
