#
# Cookbook Name:: vlg-solr
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

download_url = node['vlg-solr']['download_url']

# Download and unpack
ark 'apache-solr' do
  url download_url
  version node['vlg-solr']['version']
  path node['vlg-solr']['install_dir']
  home_dir "#{node['vlg-solr']['install_dir']}"
end

template "#{node['vlg-solr']['home_dir']}/solr.xml" do
  source 'solr.xml.erb'
  mode '0644'
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
end

template "#{node['vlg-solr']['home_dir']}/zoo.cfg" do
  source 'zoo.cfg.erb'
  mode '0644'
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
end

template "#{node['vlg-solr']['base_dir']}/contexts/solr-jetty-context.xml" do
  source 'solr-jetty-context.xml.erb'
  mode '0644'
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
  variables({
                :vlg_solr_jetty_temp_dir => node['vlg-base']['app_user_home']
            })
end

template "#{node['vlg-solr']['base_dir']}/resources/log4j.properties" do
  source 'log4j.properties.erb'
  mode '0644'
  owner node['vlg-solr']['user']
  group node['vlg-solr']['group']
  variables({
                :vlg_solr_log_dir => node['vlg-solr']['logs_dir']
            })
end

template '/etc/init.d/solr' do
  source 'init.d.erb'
  mode '0755'
  variables({
                :vlg_solr_user => node['vlg-solr']['user'],
                :fqdn => node['fqdn'],
                :vlg_solr_zk_host => node['vlg-solr']['zookeeper']['host'],
                :vlg_solr_home_dir => node['vlg-solr']['home_dir'],
                :vlg_solr_base_dir => node['vlg-solr']['base_dir'],
                :vlg_solr_log_dir => node['vlg-solr']['logs_dir'],
                :vlg_solr_java_mem => node['vlg-solr']['java']['mem'],
                :vlg_solr_sql_host => node['vlg-solr']['sql']['host'],
                :vlg_solr_sql_user => node['vlg-solr']['sql']['user'],
                :vlg_solr_sql_pass => node['vlg-solr']['sql']['pass']
  })
end

# Start on boot
service 'solr' do
  action [:enable]
end
