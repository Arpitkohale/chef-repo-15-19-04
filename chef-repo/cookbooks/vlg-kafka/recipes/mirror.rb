#
# Cookbook Name:: vlg-kafka
# Recipe:: mirror
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-kafka::setup"
include_recipe "vlg-kafka::dirs"
include_recipe "vlg-kafka::init-mirror"

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