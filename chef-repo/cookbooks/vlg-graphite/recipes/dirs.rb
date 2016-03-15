#
# Cookbook Name:: vlg-graphite
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directories = [ "#{node['vlg-graphite']['home']}",
	        "#{node['vlg-graphite']['home']}/storage",
	        "#{node['vlg-graphite']['home']}/storage/whisper",
		"#{node['vlg-graphite']['home']}/storage/lists",
		"#{node['vlg-graphite']['home']}/storage/rrd",
		"#{node['vlg-graphite']['home']}/storage/log",
		"#{node['vlg-graphite']['home']}/storage/log/webapp",
		"#{node['vlg-graphite']['home']}/storage/log/build-index",
		"#{node['vlg-graphite']['home']}/storage/log/uwsgi",
		"#{node['vlg-graphite']['home']}/conf",
                "#{node['vlg-graphite']['home']}/storage/grafana",
                "#{node['vlg-graphite']['home']}/storage/grafana/data",
                "#{node['vlg-graphite']['home']}/storage/grafana/logs",
		"#{node['vlg-graphite']['seyren']['log']['path']}",
		"/var/run/uwsgi",
		"/var/lib/nginx",
		"/var/lib/nginx/tmp",
		"/var/log/carbon-c-relay",
		"/var/run/carbon-c-relay",
                "/var/run/seyren"
]
directories.each do |directory_name|
  directory directory_name do
    owner node['vlg-graphite']['user']
    group node['vlg-graphite']['user']
    mode '0775'
    action :create
  end
end
