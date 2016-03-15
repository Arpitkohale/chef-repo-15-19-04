#
# Cookbook Name:: vlg-rnd-sbx
# Recipe:: conf
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

git_username = "git_build"

# Decrypt the data bag
data = Chef::EncryptedDataBagItem.load("git", "git_build")
git_password = data["password"]

directory "#{node['vlg-base']['app_user_home']}/analytics" do
  mode "0755"
  owner "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
  action :create
end

git "#{node['vlg-base']['app_user_home']}/analytics" do
  repository "https://#{git_username}:#{git_password}@git.gio.videologygroup.com/scm/rd/analytics.git"
  action :sync
  timeout 3000
  ignore_failure true
  user "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
end