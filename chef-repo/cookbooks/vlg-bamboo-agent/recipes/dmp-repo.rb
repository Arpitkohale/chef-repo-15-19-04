#
# Cookbook Name:: vlg-bamboo-agent
# Recipe:: dmp-repo
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-bamboo-agent']['dmp_repo_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

git_username = "git_build"

data = Chef::EncryptedDataBagItem.load("git", "git_build")
git_password = data["password"]

git node['vlg-bamboo-agent']['dmp_repo_dir'] do
  repository "https://#{git_username}:#{git_password}@git.gio.videologygroup.com/scm/dmp/dmp.git"
  action :sync
  timeout 3000
  ignore_failure true
  user 'root'
  group 'root'
end
