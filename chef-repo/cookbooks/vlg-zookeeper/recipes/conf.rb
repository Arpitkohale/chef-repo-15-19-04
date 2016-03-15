#
# Cookbook Name:: vlg-zookeeper
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Create limits.d conf to set zookeeper open file limit and max processes
template "/etc/security/limits.d/#{node["zookeeper"]["user"]}.conf" do
    source "limits.conf.erb"
    owner node["vlg-zookeeper"]["user"]
    group node["vlg-zookeeper"]["group"]
    mode "0755"
    backup false
end

# Configure zookeeper user's bash profile
template "/home/#{node['vlg-zookeeper']['user']}/.bash_profile" do
    source  "bash_profile.erb"
    owner node["vlg-zookeeper"]["user"]
    group node["vlg-zookeeper"]["group"]
    mode  00755
end

# Configure zookeeper's log4j properties
template node['vlg-zookeeper']['conf_dir'] + "/log4j.properties" do
    source  "log4j.properties.erb"
    group node["vlg-zookeeper"]["group"]
    owner node["vlg-zookeeper"]["user"]
    mode 00755
    action :create
end

# Configure zookeeper's server properties
template node['vlg-zookeeper']['conf_dir'] + "/zoo.cfg" do
    source  "zoo.cfg.erb"
    group node["vlg-zookeeper"]["group"]
    owner node["vlg-zookeeper"]["user"]
    mode 00755
    action :create
end

# Create the zookeeper myid file
template node['vlg-zookeeper']['data_dir'] + "/myid" do
    source "myid.erb"
    group node["vlg-zookeeper"]["group"]
    owner node["vlg-zookeeper"]["user"]
    mode 00755
    action :create
end

# Configure zookeeper's env file
template node['vlg-zookeeper']['zookeeper_base'] + "/bin/zkEnv.sh" do
    source  "zkEnv.sh.erb"
    group node["vlg-zookeeper"]["group"]
    owner node["vlg-zookeeper"]["user"]
    mode 00755
    action :create
end
