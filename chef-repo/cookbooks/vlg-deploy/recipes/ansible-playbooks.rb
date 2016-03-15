#
# Cookbook Name:: vlg-deploy
# Recipe:: ansible-playbooks
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

git "#{node['vlg-deploy']['ansible_playbooks_dir']}" do
  repository "#{node['vlg-base']['git_url']}/scm/gio/ansible-playbooks.git"
  user "#{node['vlg-base']['app_user']}"
  action :sync
  timeout 30
  ignore_failure true
  enable_submodules true
end
