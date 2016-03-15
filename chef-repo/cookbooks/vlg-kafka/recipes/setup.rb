#
# Cookbook Name:: vlg-kafka
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-kafka']['download_url']
kafka_perf_download_url = node['vlg-kafka']['kafka-perf_download_url']

# Download and unpack
ark 'kafka' do
    url download_url
    version "#{node['vlg-kafka']['scala_version']}"'-'"#{node['vlg-kafka']['version']}"
    path node['vlg-kafka']['install_dir']
    home_dir node['vlg-kafka']['kafka_home']
end

remote_file "#{node['vlg-kafka']['libs_dir']}/kafka-perf_2.10-#{node['vlg-kafka']['kafka-perf_version']}.jar" do
    source kafka_perf_download_url
    owner node['vlg-kafka']['user']
    group node['vlg-kafka']['group']
    mode   00644
    action :create
end
