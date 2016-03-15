#
# Cookbook Name:: vlg-kafka
# Recipe:: conf
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Create limits.d conf to set kafka open file limit and max processes

# Configure kafka's log4j properties
template node['vlg-kafka']['conf_dir'] + "/log4j.properties" do
    source  "log4j.properties.erb"
    group node["vlg-kafka"]["group"]
    owner node["vlg-kafka"]["user"]
    mode 00755
    action :create
end

# Configure kafka's server properties
template node['vlg-kafka']['conf_dir'] + "/server.properties" do
    source  "server.properties.erb"
    group node["vlg-kafka"]["group"]
    owner node["vlg-kafka"]["user"]
    mode 00755
    action :create
    variables({
    :vlg_zk_servers => node['vlg-kafka']['zoo_servers'],
    :kafka_graphite_enabled => node['vlg-kafka']['kafka-graphite']['enabled']
    })
end

# Configure kafka's consumer properties
template node['vlg-kafka']['conf_dir'] + "/consumer.properties" do
    source  "consumer.properties.erb"
    group node["vlg-kafka"]["group"]
    owner node["vlg-kafka"]["user"]
    mode 00755
    action :create
    variables({
    :vlg_zk_servers => node['vlg-kafka']['zoo_servers'],
    :vlg_mirror_group => node['vlg-kafka']['mirror_group_name'],
    :auto_offset_reset => node['vlg-kafka']['auto_offset_reset']
    })
end

# Configure kafka's producer properties
template node['vlg-kafka']['conf_dir'] + "/producer.properties" do
    source  "producer.properties.erb"
    group node["vlg-kafka"]["group"]
    owner node["vlg-kafka"]["user"]
    mode 00755
    action :create
    variables({
    :metadata_broker_list => node['vlg-kafka']['kafka_servers'],
    :producer_type => node['vlg-kafka']['producer_type']
    })
end

# Configure kafka's zookeeper properties
template node['vlg-kafka']['conf_dir'] + "/zookeeper.properties" do
    source  "zookeeper.properties.erb"
    group node["vlg-kafka"]["group"]
    owner node["vlg-kafka"]["user"]
    mode 00755
    action :create
end
