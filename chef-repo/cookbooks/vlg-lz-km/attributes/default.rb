# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end

# metrics
default['vlg-cron']['jobs']['vlg-lz-kafka-queue-size-upload'] = {
  'time' => '*/5 * * * *',
  'command' => "#{node['vlg-base']['bin_dir']}/cronscripts-lz-kf/DataDog.Push.Kafka.Mirror.Stats.sh >> #{node['vlg-base']['log_dir']}/DataDog.Push.Kafka.Mirror.Stats.run.log",
}

#kafka
# If we're setting up kafka mirroring in usva, ie, set up the mirror tool to copy data from usor to usva, then we
# should point the tool to the usor zookeeper cluster and usva kafka servers and vice versa for usor.
# More info here - https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=27846330
case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-kafka']['mirror_group_name'] = "mirror-usva"
        default['vlg-kafka']['zoo_servers'] = "usorlzzkprd01.inf.videologygroup.com:2181,usorlzzkprd02.inf.videologygroup.com:2181,usorlzzkprd03.inf.videologygroup.com:2181"
        default['vlg-kafka']['kafka_servers'] = "usvalzkfprd01.inf.videologygroup.com:9092,usvalzkfprd02.inf.videologygroup.com:9092,usvalzkfprd03.inf.videologygroup.com:9092"
        default['vlg-kafka']['consumer']['offsets.storage'] = "kafka"
        default['vlg-kafka']['consumer']['dual.commit.enabled'] = "false"
      when "usor"
        default['vlg-kafka']['mirror_group_name'] = "mirror-usor"
        default['vlg-kafka']['zoo_servers'] = "usvalzzkprd01.inf.videologygroup.com:2181,usvalzzkprd02.inf.videologygroup.com:2181,usvalzzkprd03.inf.videologygroup.com:2181"
        default['vlg-kafka']['kafka_servers'] = "usorlzkzprd04.inf.videologygroup.com:9092,usorlzkzprd05.inf.videologygroup.com:9092,usorlzkzprd06.inf.videologygroup.com:9092"
        default['vlg-kafka']['consumer']['offsets.storage'] = "kafka"
        default['vlg-kafka']['consumer']['dual.commit.enabled'] = "false"
      when "euir"
        default['vlg-kafka']['mirror_group_name'] = "mirror-euir"
        default['vlg-kafka']['zoo_servers'] = "dmp-prd-usva-zoo-1.inf.videologygroup.com:2181,dmp-prd-usva-zoo-2.inf.videologygroup.com:2181,dmp-prd-usva-zoo-3.inf.videologygroup.com:2181"
        default['vlg-kafka']['kafka_servers'] = "dmp-prd-euir-zoo-1.inf.videologygroup.com:9092,dmp-prd-euir-zoo-2.inf.videologygroup.com:9092,dmp-prd-euir-zoo-3.inf.videologygroup.com:9092"
      when "apsg"
        default['vlg-kafka']['mirror_group_name'] = "mirror-apsg"
        default['vlg-kafka']['zoo_servers'] = "dmp-prd-usva-zoo-1.inf.videologygroup.com:2181,dmp-prd-usva-zoo-2.inf.videologygroup.com:2181,dmp-prd-usva-zoo-3.inf.videologygroup.com:2181"
        default['vlg-kafka']['kafka_servers'] = "dmp-prd-usor-zoo-1.inf.videologygroup.com:9092,dmp-prd-usor-zoo-2.inf.videologygroup.com:9092,dmp-prd-usor-zoo-3.inf.videologygroup.com:9092"
    end
  when "staging"
    default['vlg-kafka']['zoo_servers'] = "dmp-stg-usva-zoo-1.videologygroup.com:2181,dmp-stg-usva-zoo-2.videologygroup.com:2181,dmp-stg-usva-zoo-3.videologygroup.com:2181"
    default['vlg-kafka']['zoo_servers'] = "dmp-stg-usva-zoo-1.videologygroup.com:9092,dmp-stg-usva-zoo-2.videologygroup.com:9092,dmp-stg-usva-zoo-3.videologygroup.com:9092"
  when "sandbox"
    default['vlg-kafka']['zoo_servers'] = "dmp-sbx-usva-zoo-1.videologygroup.com:2181,dmp-sbx-usva-zoo-2.videologygroup.com:2181,dmp-sbx-usva-zoo-3.videologygroup.com:2181"
    default['vlg-kafka']['zoo_servers'] = "dmp-sbx-usva-zoo-1.videologygroup.com:9092,dmp-sbx-usva-zoo-2.videologygroup.com:9092,dmp-sbx-usva-zoo-3.videologygroup.com:9092"
  else #vagrant
    default['vlg-kafka']['zoo_servers'] = "localhost:2181"
    default['vlg-kafka']['zoo_servers'] = "localhost:9092"
end