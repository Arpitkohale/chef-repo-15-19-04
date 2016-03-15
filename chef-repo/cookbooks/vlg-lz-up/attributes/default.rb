# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default['vlg-tomcat']['version'] = '7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle'
default['vlg-tomcat']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-tomcat-7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle.tar.gz'
default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'HTTP/1.1'
default['vlg-tomcat']['port_9030']['enable'] = 'true'
default['vlg-tomcat']['port_9030']['protocol'] = 'HTTP/1.1'
default['vlg-tomcat']['port_8443']['enable'] = 'true'
default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
case node.chef_environment
when "production"
force_default['vlg-tomcat']['port_8443']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
force_default['vlg-tomcat']['port_8443']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
when "sandbox"
force_default['vlg-tomcat']['port_8443']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.qa.videologygroup.com.crt'
force_default['vlg-tomcat']['port_8443']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.qa.videologygroup.com.key'
end

default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'dsp.war'
case node.chef_environment
when "production"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
when "sandbox"
  default["vlg-tomcat"]["jvm_heap"] = "3g"
end

default['vlg-tomcat']['app_deployment'] = 'standard.dmp'

case node['vlg-base']['location']
  when "vagrant"
    default['vlg-tomcat']['aws_datacenter'] = "vagrant"
  when "usva"
    case node.chef_environment
      when "production"
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.us.virginia'
      else
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.sandbox'
    end
  when "usor"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.us.oregon'
  when "euir"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.eu.ireland'
  when "apsg"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.ap.singapore'
end

# datadog
default['datadog']['tags'] = 'Eliza'

# swap
case node.chef_environment
  when "production"
    force_override['vlg-swap']['size'] = 14336
  when "sandbox"
    force_override['vlg-swap']['size'] = 5120
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end
