# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default['vlg-tomcat']['version'] = '7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle'
default['vlg-tomcat']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-tomcat-7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle.tar.gz'
default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'HTTP/1.1'
default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'ROOT.war'
default['vlg-tomcat']['jvm_heap'] = '3g'

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'optdev' ] + [ 'appdev' ]

# appdev
case node.chef_environment
when "development"
  default['vlg-ad-li']['env'] = 'dev'
when "sandbox"
  default['vlg-ad-li']['env'] = 'dev'
when "staging"
  default['vlg-ad-li']['env'] = 'stg'
when "endtoend"
  default['vlg-ad-li']['env'] = 'ete'
when "production"
  default['vlg-ad-li']['env'] = 'prd'
else
  default['vlg-ad-li']['env'] = 'dev'
end

# solr
default['vlg-solr5']['solr_heap'] = '3g'
