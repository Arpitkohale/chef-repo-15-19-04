# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default['vlg-tomcat']['version'] = '7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle'
default['vlg-tomcat']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-tomcat-7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle.tar.gz'
default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'org.apache.coyote.http11.Http11NioProtocol'
default['vlg-tomcat']['port_9030']['enable'] = 'true'
default['vlg-tomcat']['port_9030']['protocol'] = 'org.apache.coyote.http11.Http11NioProtocol'
default['vlg-tomcat']['port_8443']['enable'] = 'false'
default['vlg-tomcat']['port_8444']['enable'] = 'false'
default['vlg-tomcat']['port_8445']['enable'] = 'false'
default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'dsp.war'
case node.chef_environment
when "production"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
end

default['vlg-tomcat']['app_deployment'] = "optlite"

# datadog
default['datadog']['tags'] = 'Opt'

# swap
case node.chef_environment
when "production"
  force_override['vlg-swap']['size'] = 1024
when "sandbox"
  force_override['vlg-swap']['size'] = 1024
end
