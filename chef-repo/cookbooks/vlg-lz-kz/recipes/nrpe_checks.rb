# Cookbook Name:: vlg-lz-kz
# Recipe:: nrpe_checks
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

nrpe_check "check_kafka_procs" do
  command "#{node['nrpe']['plugin_dir']}/check_procs"
  critical_condition '1:1'
  parameters "-a  kafka.Kafka -u vlg"
  action :add
end

nrpe_check "check_kafka_tcp_port" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '20'
  parameters "-H localhost -p 9092"
  action :add
end

nrpe_check "check_zookeeper_procs" do
  command "#{node['nrpe']['plugin_dir']}/check_procs"
  critical_condition '1:1'
  parameters "-a org.apache.zookeeper.server.quorum.QuorumPeerMain -u vlg"
  action :add
end

nrpe_check "check_zookeeper_ruok_imok" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '10'
  parameters "-H localhost -p 2181 -s ruok -e imok"
  action :add
end

nrpe_check "check_zookeeper_zk_server_state" do
  command "#{node['nrpe']['plugin_dir']}/check_tcp"
  critical_condition '10'
  parameters "-H localhost -p 2181 -s mntr -e zk_server_state"
  action :add
end
