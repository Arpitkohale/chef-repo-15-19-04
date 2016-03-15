#
# Cookbook Name:: vlg-base
# Recipe:: bin
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

git "#{node['vlg-base']['bin_dir']}" do
  repository "#{node['vlg-base']['git_url']}/scm/gio/vlg-bin.git"
  action :sync
  timeout 30
  depth 2
  ignore_failure true
end
