#
# Cookbook Name:: vlg-ad-tv
# Recipe:: repo
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

git "#{node['vlg-ad-tv']['tv-nielsen-data']}" do
  repository "#{node['vlg-base']['git_url']}/scm/ap/tv-nielsen-data.git"
  action :sync
  timeout 30
  ignore_failure true
end

git "#{node['vlg-ad-tv']['tv-db-redshift_sync']}" do
  repository "#{node['vlg-base']['git_url']}/scm/ap/tv-db-redshift-sync.git"
  action :sync
  timeout 30
  ignore_failure true
end
