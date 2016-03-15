# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]

#zookeeper
case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['zookeeper']['zoo.cfg']['server.1'] = "usvalzzkprd01.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.2'] = "usvalzzkprd02.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.3'] = "usvalzzkprd03.inf.videologygroup.com:2888:3888"
      when "usor"
        default['zookeeper']['zoo.cfg']['server.4'] = "dmp-prd-usor-zoo-1.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.5'] = "dmp-prd-usor-zoo-2.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.6'] = "dmp-prd-usor-zoo-3.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.7'] = "usorlzzkprd01.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.8'] = "usorlzzkprd02.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.9'] = "usorlzzkprd03.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.10'] = "usorlzzkprd04.inf.videologygroup.com:2888:3888"
      when "euir"
        default['zookeeper']['zoo.cfg']['server.1'] = "euirlzzkprd01.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.2'] = "euirlzzkprd02.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.3'] = "euirlzzkprd03.inf.videologygroup.com:2888:3888"
      when "apsg"
        default['zookeeper']['zoo.cfg']['server.1'] = "apsglzzkprd01.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.2'] = "apsglzzkprd02.inf.videologygroup.com:2888:3888"
        default['zookeeper']['zoo.cfg']['server.3'] = "apsglzzkprd03.inf.videologygroup.com:2888:3888"
    end
  when "staging"
    default['zookeeper']['zoo.cfg']['server.1'] = "usvalzzkstg01.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.2'] = "usvalzzkstg02.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.3'] = "usvalzzkstg03.inf.videologygroup.com:2888:3888"
  when "sandbox"
    default['zookeeper']['zoo.cfg']['server.1'] = "dmp-sbx-usva-zoo-1.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.2'] = "dmp-sbx-usva-zoo-2.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.3'] = "dmp-sbx-usva-zoo-3.videologygroup.com:2888:3888"
  when "endtoend"
    default['zookeeper']['zoo.cfg']['server.1'] = "usvalzzkete01.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.2'] = "usvalzzkete02.inf.videologygroup.com:2888:3888"
    default['zookeeper']['zoo.cfg']['server.3'] = "usvalzzkete03.inf.videologygroup.com:2888:3888"
  else #vagrant
    default['zookeeper']['zoo.cfg']['server.1'] = "localhost:2888:3888"
end

# hostsfile
default['vlg-base']['hostname_hosts_entry'] = node['ipaddress']
default['vlg-base']['hostname_hosts_entry_unique'] = true
