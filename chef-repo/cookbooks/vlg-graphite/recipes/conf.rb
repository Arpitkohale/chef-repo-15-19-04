#
# Cookbook Name:: vlg-graphite
# Recipe:: conf
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# memcached
template '/etc/sysconfig/memcached' do
  source 'memcached.erb'
  mode '0755'
  action :create
  notifies :restart, "service[memcached]", :delayed
end

# graphite.wsgi
template "#{node['vlg-graphite']['home']}/conf/graphite.wsgi" do
  source 'graphite.wsgi.erb'
  mode '0755'
  action :create
end

# local_settings.py
template "#{node['vlg-graphite']['home']}/webapp/graphite/local_settings.py" do
  source 'local_settings.py.erb'
  mode '0755'
  action :create
  notifies :run, "execute[syncdb]", :immediately
end

execute "syncdb" do
  action :nothing
  command "sudo -u #{node['vlg-graphite']['user']} python #{node['vlg-graphite']['home']}/webapp/graphite/manage.py syncdb --noinput"
end

# carbon.conf
template "#{node['vlg-graphite']['home']}/conf/carbon.conf" do
  source 'carbon.conf.erb'
  mode '0755'
  action :create
end

# carbon-c-relay.conf
template "/etc/carbon-c-relay.conf" do
  source 'carbon-c-relay.conf.erb'
  mode '0755'
  action :create
  notifies :run, "execute[reload_carbon_c_relay]", :delayed
end

# /etc/sysconfig/carbon-c-relay
template "/etc/sysconfig/carbon-c-relay" do
  source 'sysconfig-carbon-c-relay.erb'
  mode '0755'
  action :create
  notifies :run, "execute[reload_carbon_c_relay]", :delayed
end

execute "reload_carbon_c_relay" do
  action :nothing
  command "/bin/kill -HUP `/sbin/pidof carbon-c-relay`"
end

# storage-schemas.conf
template "#{node['vlg-graphite']['home']}/conf/storage-schemas.conf" do
  source 'storage-schemas.conf.erb'
  mode '0755'
  action :create
end

# graphiteTemplates.conf
template "#{node['vlg-graphite']['home']}/conf/graphTemplates.conf" do
  source 'graphTemplates.conf.erb'
  mode '0755'
  action :create
end

# storage-aggregation.conf
template "#{node['vlg-graphite']['home']}/conf/storage-aggregation.conf" do
  source 'storage-aggregation.conf.erb'
  mode '0755'
  action :create
end

# nginx.conf
template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  mode '0755'
  action :create
  notifies :reload, "service[nginx]", :delayed
end

# grafana.ini
template '/etc/grafana/grafana.ini' do
  source 'grafana.ini.erb'
  mode '0644'
  action :create
  notifies :restart, "service[grafana-server]", :delayed
end

# /etc/sysconfig/grafana-server
template '/etc/sysconfig/grafana-server' do
  source 'grafana-server-sysconfig.erb'
  mode '0644'
  action :create
  notifies :restart, "service[grafana-server]", :delayed
end

# seyren.conf
template node['vlg-graphite']['seyren']['conf'] do
  source 'seyren.conf.erb'
  mode '0755'
  action :create
end
