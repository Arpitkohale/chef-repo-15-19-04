# Cookbook Name:: vlg-storm
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template "#{node['vlg-storm']['conf_dir']}/storm.yaml" do
  source 'storm.yaml.erb'
  mode 00644
  variables({
                :zookeeper_quorum => node['vlg-storm']['zookeeper_quorum'],
                :storm_graphite_enabled => node['vlg-storm']['storm-graphite']['enabled']
            })
end
