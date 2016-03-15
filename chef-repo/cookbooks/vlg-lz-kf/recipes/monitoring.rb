#
# Cookbook Name:: vlg-lz-kf
# Recipe:: monitoring
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

#package form metrics
python_pip "stormkafkamon" do
  version "0.1.1"
end

#Nagios agent configuration
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
