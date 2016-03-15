#
# Cookbook Name:: vlg-cron
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/cron.d/vlg' do
  source 'vlg_crontab.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
