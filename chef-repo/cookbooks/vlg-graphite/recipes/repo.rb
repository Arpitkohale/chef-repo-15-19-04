#
# Cookbook Name:: vlg-graphite
# Recipe:: repo
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

yum_repository 'grafana' do
  description 'grafana'
  baseurl "https://packagecloud.io/grafana/stable/el/6/$basearch"
  gpgkey "https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana"
  action :create
end
