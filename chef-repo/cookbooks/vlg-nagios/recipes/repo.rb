#
# Cookbook Name:: vlg-nagios
# Recipe:: repo
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

git "#{node['vlg-nagios']['repo_dir']}" do
  repository "#{node['vlg-base']['git_url']}/scm/gio/nagios.git"
  action :sync
  timeout 30
  ignore_failure true
end

directory "/etc/nagios" do
  action :delete
  recursive true
  not_if "test -L /etc/nagios"
end

link "/etc/nagios" do
  to "#{node['vlg-nagios']['repo_dir']}"
end
