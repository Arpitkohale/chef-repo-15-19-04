#
# Cookbook Name:: vlg-storm
# Recipe:: export_cluster_metrics
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/init.d/export_cluster_metrics' do
  source 'export_cluster_metrics.erb'
  owner node['vlg-storm']['user']
  group node['vlg-storm']['group']
  mode 0755
end

template "#{node['vlg-lz-sm-nb']['cluster-metrics-script-dir']}/ExportClusterMetrics.groovy" do
  source 'ExportClusterMetrics.groovy.erb'
  owner node['vlg-storm']['user']
  group node['vlg-storm']['group']
  mode 0755
end

# Start on boot
service 'export_cluster_metrics' do
  action [:enable]
end