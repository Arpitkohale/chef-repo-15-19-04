# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

data = Chef::EncryptedDataBagItem.load("lz", "db")
sql_password = data["lucidmedia-password"]

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-solr']['java']['mem'] = '5g'
      when "usor"
        default['vlg-solr']['java']['mem'] = '5g'
        default['vlg-solr']['zookeeper']['host'] = 'usvalzslprd03.inf.videologygroup.com:2181'
      when "euir"
        default['vlg-solr']['java']['mem'] = '5g'
        default['vlg-solr']['zookeeper']['host'] = 'euirlzzkprd01.inf.videologygroup.com:2181,euirlzzkprd02.inf.videologygroup.com:2181,euirlzzkprd03.inf.videologygroup.com:2181'
        default['vlg-solr']['sql']['host'] = 'jdbc:mysql://dmp-prod-usor-db.videologygroup.com:3306/dmp'
        default['vlg-solr']['sql']['user'] = 'lucidmedia'
        default['vlg-solr']['sql']['pass'] = sql_password
      when "apsg"
        default['vlg-solr']['java']['mem'] = '5g'
        default['vlg-solr']['zookeeper']['host'] = 'apsglzzkprd01.inf.videologygroup.com:2181,apsglzzkprd02.inf.videologygroup.com:2181,apsglzzkprd03.inf.videologygroup.com:2181'
        default['vlg-solr']['sql']['host'] = 'jdbc:mysql://dmp-prod-usor-db.videologygroup.com:3306/dmp'
        default['vlg-solr']['sql']['user'] = 'lucidmedia'
        default['vlg-solr']['sql']['pass'] = sql_password
    end
  when "staging"
    default['vlg-solr']['java']['mem'] = '5g'
    default['vlg-solr']['zookeeper']['host'] = 'usvalzzkstg01.inf.videologygroup.com:2181,usvalzzkstg02.inf.videologygroup.com:2181,usvalzzkstg03.inf.videologygroup.com:2181'
    default['vlg-solr']['sql']['host'] = 'jdbc:mysql://dmp-stg-usva-db.videologygroup.com:3306/dmp'
    default['vlg-solr']['sql']['user'] = 'lucidmedia'
    default['vlg-solr']['sql']['pass'] = 'webversafs'
  when "endtoend"
    default['vlg-solr']['java']['mem'] = '5g'
    default['vlg-solr']['zookeeper']['host'] = 'usvalzzkete01.inf.videologygroup.com:2181,usvalzzkete02.inf.videologygroup.com:2181,usvalzzkete03.inf.videologygroup.com:2181'
    default['vlg-solr']['sql']['host'] = 'jdbc:mysql://dmp-ete-usva-db.inf.videologygroup.com:3306/dmp'
    default['vlg-solr']['sql']['user'] = 'lucidmedia'
    default['vlg-solr']['sql']['pass'] = sql_password
  when "sandbox"
    default['vlg-solr']['java']['mem'] = '5g'
    default['vlg-solr']['zookeeper']['host'] = 'localhost:2181'
  else #vagrant
    default['vlg-solr']['java']['mem'] = '512m'
end

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
