#
# Cookbook Name:: vlg-nagios
# Recipe:: pagerduty
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "/etc/yum.repos.d/pdagent.repo" do
  source "pdagent.repo.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
  notifies :run, "bash[yum_pdagent_repo]", :immediately
end

bash "yum_pdagent_repo" do
  user "root"
  code <<-EOH
    yum makecache
    rpm --import http://packages.pagerduty.com/GPG-KEY-RPM-pagerduty
  EOH
  action :nothing
end

packages = [ "pdagent", "pdagent-integrations" ]
packages.each do |package_name|
  package package_name do
    action :upgrade
  end
end
