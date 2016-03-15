# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# swap
case node.chef_environment
when "production"
  force_override['vlg-swap']['size'] = 20480
when "sandbox"
  force_override['vlg-swap']['size'] = 10240
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end

#kafka-zookeeper
case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-kafka']['zoo_servers'] = "usvalzkzprd01.inf.videologygroup.com:2181,usvalzkzprd02.inf.videologygroup.com:2181,usvalzkzprd03.inf.videologygroup.com:2181"
        default['zookeeper']['zoo.cfg']['server.1'] = "usvalzkzprd01.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.2'] = "usvalzkzprd02.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.3'] = "usvalzkzprd03.inf.videologygroup.com:2888:3888"
      when "usor"
        default['vlg-kafka']['zoo_servers'] = "usorlzzkprd01.inf.videologygroup.com:2181,usorlzzkprd02.inf.videologygroup.com:2181,usorlzzkprd03.inf.videologygroup.com:2181"
        default['zookeeper']['zoo.cfg']['server.4'] = "dmp-prd-usor-zoo-1.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.5'] = "dmp-prd-usor-zoo-2.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.6'] = "dmp-prd-usor-zoo-3.videologygroup.com:2888:3888"
        default['vlg-kafka']['jvm_heap'] = "10G"
      when "euir"
        default['vlg-kafka']['zoo_servers'] = "localhost:2181"
        default['zookeeper']['zoo.cfg']['server.1'] = "localhost:2888:3888"
      when "apsg"
        default['vlg-kafka']['zoo_servers'] = "localhost:2181"
        default['zookeeper']['zoo.cfg']['server.1'] = "localhost:2888:3888"
    end
  when "staging"
    default['vlg-kafka']['zoo_servers'] = "localhost:2181"
    default['zookeeper']['zoo.cfg']['server.1'] = "localhost:2888:3888"
  when "sandbox"
    default['vlg-kafka']['zoo_servers'] = "usvalzkzsbx01.inf.videologygroup.com:2181,usvalzkzsbx02.inf.videologygroup.com:2181,usvalzkzsbx03.inf.videologygroup.com:2181"
    default['zookeeper']['zoo.cfg']['server.1'] = "usvalzkzsbx01.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.2'] = "usvalzkzsbx02.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.3'] = "usvalzkzsbx03.inf.videologygroup.com:2888:3888"
  else #vagrant
    default['vlg-kafka']['zoo_servers'] = "localhost:2181"
end

# hostsfile
default['vlg-base']['hostname_hosts_entry'] = node['ipaddress']
default['vlg-base']['hostname_hosts_entry_unique'] = true