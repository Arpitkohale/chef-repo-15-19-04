#
# Cookbook Name:: vlg-kafka
# Recipe:: init
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/init.d/kafka' do
  source 'init.erb'
  mode '0755'
  action :create
end

# Start on boot
service 'kafka' do
  action [:enable]
end

# Start
case node['vlg-base']['location']
  when "vagrant"
    service 'kafka' do
      action [:start]
    end
  end

# Create topics
bash 'create_kafka_topics' do
  code <<-EOH
    ZOO_SERVER=`echo "#{node['vlg-kafka']['zoo_servers']}" | cut -d ',' -f1`
    ZNAME=`echo $ZOO_SERVER | cut -d ':' -f1`
    ZPORT=`echo $ZOO_SERVER | cut -d ':' -f2`
    while ! nc -z -v -w 1 $ZNAME $ZPORT; do sleep 1; done
    while ! nc -z -v -w 1 localhost 9092; do sleep 1; done
    IFS=',' read -ra KAFKA_NAMES <<< #{node['vlg-kafka']['topic_names']}
    for i in "${KAFKA_NAMES[@]}"; do
      topicName=`echo $i | cut -d ':' -f1`
      numPartitions=`echo $i | cut -d ':' -f2`
      replicationFactor=`echo $i | cut -d ':' -f3`
      if [ ! -d "#{node['vlg-kafka']['data_dir']}/$topicName-0" ]
      then
        #{node['vlg-kafka']['install_dir']}/kafka/bin/kafka-topics.sh --create --zookeeper #{node['vlg-kafka']['zoo_servers']} --topic $topicName --partitions $numPartitions --replication-factor $replicationFactor
      fi
    done
  EOH
  action :run
end