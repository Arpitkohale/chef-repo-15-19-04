# coding: UTF-8

default['vlg-kafka']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-kafka']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-kafka']['version'] = '0.8.2.0'
default['vlg-kafka']['scala_version'] = '2.11'
default['vlg-kafka']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/kafka_2.11-0.8.2.0.tgz'
default['vlg-kafka']['kafka-perf_version'] = '0.8.0'
default['vlg-kafka']['kafka-perf_download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/kafka-perf_2.10-0.8.0.jar'
default['vlg-kafka']['install_dir'] = '/usr/local'
default['packages'] = node['packages'] + [ 'openssl-devel' ]

# kafka defaults
default['vlg-kafka']['kafka_home'] = "#{node['vlg-kafka']['install_dir']}/kafka"
default['vlg-kafka']['kafka_pid'] = "/var/run/kafka.pid"
default['vlg-kafka']['conf_dir'] = "#{node['vlg-kafka']['kafka_home']}/config"
default['vlg-kafka']['libs_dir'] = "#{node['vlg-kafka']['kafka_home']}/libs"
default['vlg-kafka']['logs_dir'] = "#{node['vlg-base']['log_dir']}/kafka"
default['vlg-kafka']['data_dir'] = "/data/kafka"
default['vlg-kafka']['producer_type'] = "async"
default['vlg-kafka']['mirror_group_name'] = "mirror"
default['vlg-kafka']['zoo_servers'] = "localhost:2181"
default['vlg-kafka']['kafka_servers'] = "localhost:9092"
default['vlg-kafka']['partitions'] = 40
default['vlg-kafka']['jmx_port'] = "9999"
default['vlg-kafka']['broker']['socket.send.buffer.bytes'] = "102400"
default['vlg-kafka']['consumer']['socket.receive.buffer.bytes'] = "65536"
default['vlg-kafka']['consumer']['fetch.message.max.bytes'] = "1048576"
default['vlg-kafka']['broker']['log.retention.hours'] = "72"

# java
default['vlg-kafka']['jvm_heap'] = "1G"

#topics
default['vlg-kafka']['topic_names'] = "kafka.dmp.storm.updates.queue:40:2,kafka.dmp.storm.fastlane:40:2"

# kafka-graphite defaults
case node.chef_environment
when "sandbox"
  default['vlg-kafka']['graphite']['host'] = 'graphite.inf.videologygroup.com'
  default['vlg-kafka']['graphite']['port'] = '2003'
  default['vlg-kafka']['graphite']['prefix'] = 'vlg.eliza.kafka.sandbox'

  default['vlg-kafka']['kafka-graphite']['enabled'] = true

  default['vlg-kafka']['metrics-graphite']['install_dest'] = "#{node['vlg-kafka']['libs_dir']}/metrics-graphite-2.2.0.jar"
  default['vlg-kafka']['metrics-graphite']['url']        = 'http://s3.amazonaws.com/videologypublic/repo/metrics-graphite-2.2.0.jar'
  default['vlg-kafka']['metrics-graphite']['checksum']   = '6b4042aabf532229f8678b8dcd34e2215d94a683270898c162175b1b13d87de4'

  default['vlg-kafka']['kafka-graphite']['install_dest'] = "#{node['vlg-kafka']['libs_dir']}/kafka-graphite-1.0.0.jar"
  default['vlg-kafka']['kafka-graphite']['url']        = 'http://s3.amazonaws.com/videologypublic/repo/kafka-graphite-1.0.0.jar'
  default['vlg-kafka']['kafka-graphite']['checksum']   = '3bbc2d110a69927f77307cd0b6b87b00b7c57074f313d57ba17bdee6edfbe6ac'
else
  default['vlg-kafka']['kafka-graphite']['enabled'] = false
end