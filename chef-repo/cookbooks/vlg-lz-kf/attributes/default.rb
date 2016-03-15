# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

#kafka
case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-kafka']['zoo_servers'] = "usvalzzkprd01.inf.videologygroup.com:2181,usvalzzkprd02.inf.videologygroup.com:2181,usvalzzkprd03.inf.videologygroup.com:2181"
        default['vlg-kafka']['jvm_heap'] = '5G'
        default['vlg-kafka']['broker']['log.retention.hours'] = "336"
      when "usor"
        default['vlg-kafka']['zoo_servers'] = "usorlzzkprd01.inf.videologygroup.com:2181,usorlzzkprd02.inf.videologygroup.com:2181,usorlzzkprd03.inf.videologygroup.com:2181"
      when "euir"
        default['vlg-kafka']['zoo_servers'] = "euirlzzkprd01.inf.videologygroup.com:2181,euirlzzkprd02.inf.videologygroup.com:2181,euirlzzkprd03.inf.videologygroup.com:2181"
      when "apsg"
        default['vlg-kafka']['zoo_servers'] = "apsglzzkprd01.inf.videologygroup.com:2181,apsglzzkprd02.inf.videologygroup.com:2181,apsglzzkprd03.inf.videologygroup.com:2181"
    end
  when "staging"
    default['vlg-kafka']['zoo_servers'] = "usvalzzkstg01.inf.videologygroup.com:2181"
  when "sandbox"
    default['vlg-kafka']['zoo_servers'] = "dmp-sbx-usva-zoo-1.videologygroup.com:2181,dmp-sbx-usva-zoo-2.videologygroup.com:2181,dmp-sbx-usva-zoo-3.videologygroup.com:2181"
  when "endtoend"
    default['vlg-kafka']['zoo_servers'] = "usvalzzkete01.inf.videologygroup.com:2181,usvalzzkete02.inf.videologygroup.com:2181,usvalzzkete03.inf.videologygroup.com:2181"
  else #vagrant
    default['vlg-kafka']['zoo_servers'] = "localhost:2181"
end

unless Chef::Config[:solo]
  default['vlg-swap']['size'] = 20480
  default['vlg-kafka']['jvm_heap'] = '5G'
end

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]

# metrics
default['vlg-cron']['jobs']['vlg-lz-kafka-queue-size-upload'] = {
    'time' => '*\5 * * * *',
    'command' => "#{node['vlg-base']['bin_dir']}/cronscripts-lz-kf/DataDog.Push.Kafka.Stats.sh >> #{node['vlg-base']['log_dir']}/DataDog.Push.Kafka.Stats.run.log",
}
