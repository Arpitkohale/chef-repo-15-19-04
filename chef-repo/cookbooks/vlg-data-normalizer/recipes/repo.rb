  #
# Cookbook Name:: vlg-data-normalizer
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

git_username = "git_build"
data = Chef::EncryptedDataBagItem.load("git", "git_build")
git_password = data["password"]

git "#{node['vlg-base']['app_user_home']}/app-fte-normalizer" do
  repository "https://#{git_username}:#{git_password}@git.gio.videologygroup.com/scm/data/ftenormalizer.git"
  action :sync
  timeout 3000
  ignore_failure true
  user "#{node['vlg-base']['app_user']}"
  group "#{node['vlg-base']['app_user']}"
end
