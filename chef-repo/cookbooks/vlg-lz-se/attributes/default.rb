# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default['vlg-tomcat']['version'] = '7.0.63'
default['vlg-tomcat']['download_url'] = 'http://videologypublic.s3.amazonaws.com/repo/apache-tomcat-7.0.63.tar.gz'

default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'HTTP/1.1'

default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'dsp.war'
default['vlg-tomcat']['app_deployment'] = 'standard.dmp'
default['vlg-tomcat']['keep_alive_timeout'] = '100'
default['vlg-tomcat']['jvm_heap'] = '5g'
default['vlg-tomcat']['jvm_max_perm_size'] = '256m'

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.us.virginia'
      when "usor"
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.us.oregon'
      when "euir"
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.eu.ireland'
      when "apsg"
        default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.ap.singapore'
    end
  when "staging"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.staging'
  when "sandbox"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.sandbox'
  when "endtoend"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dmp.endtoend'
  else #vagrant
    default['vlg-tomcat']['aws_datacenter'] = 'dmp.localhost'
end

unless Chef::Config[:solo]
  default['vlg-swap']['size'] = 4096
end

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
