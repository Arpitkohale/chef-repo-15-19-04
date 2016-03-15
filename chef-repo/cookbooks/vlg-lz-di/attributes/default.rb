# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default['vlg-tomcat']['version'] = '7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle'
default['vlg-tomcat']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-tomcat-7.0.56-apr-1.5.1-tomcat-native-1.1.30-bundle.tar.gz'
default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'dsp.war'
default['vlg-tomcat']['app_deployment'] = 'standard.dmp'
default['vlg-tomcat']['keep_alive_timeout'] = '20'
default['vlg-tomcat']['jvm_heap'] = '5g'

default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'HTTP/1.1'
default['vlg-tomcat']['port_9030']['enable'] = 'true'
default['vlg-tomcat']['port_9030']['protocol'] = 'HTTP/1.1'

case node.chef_environment
  when "production"
    default['vlg-tomcat']['port_8443']['enable'] = 'true'
    default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
    default['vlg-tomcat']['port_8443']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.lucidmedia.com.crt'
    default['vlg-tomcat']['port_8443']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.lucidmedia.com.key'
    default['vlg-tomcat']['port_8444']['enable'] = 'true'
    default['vlg-tomcat']['port_8444']['protocol'] = 'HTTP/1.1'
    default['vlg-tomcat']['port_8444']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.tidaltv.com.crt'
    default['vlg-tomcat']['port_8444']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.tidaltv.com.key'
    default['vlg-tomcat']['port_8444']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'
    default['vlg-tomcat']['port_8445']['enable'] = 'true'
    default['vlg-tomcat']['port_8445']['protocol'] = 'HTTP/1.1'
    default['vlg-tomcat']['port_8445']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
    default['vlg-tomcat']['port_8445']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
    default['vlg-tomcat']['port_8445']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'
  when "staging"
    default['vlg-tomcat']['port_8443']['enable'] = 'true'
    default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
  when "sandbox"
    default['vlg-tomcat']['port_8443']['enable'] = 'true'
    default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
  when "endtoend"
    default['vlg-tomcat']['port_8443']['enable'] = 'true'
    default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
  else #vagrant
    default['vlg-tomcat']['port_8443']['enable'] = 'true'
    default['vlg-tomcat']['port_8443']['protocol'] = 'HTTP/1.1'
end

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

# swap
case node.chef_environment
  when "production"
    default['vlg-swap']['size'] = 32768
  when "staging"
    default['vlg-swap']['size'] = 32768
  when "sandbox"
    default['vlg-swap']['size'] = 32768
  when "endtoend"
    default['vlg-swap']['size'] = 32768
  else #vagrant
    default['vlg-swap']['size'] = 2048
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
when "sandbox"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end

# Scripts in https://git.gio.videologygroup.com/projects/GIO/repos/vlg-bin/browse
#cron
case node.chef_environment
  when "production"
    default['vlg-cron']['jobs']['turn-upload'] = {
        'time' => '*/10 * * * *',
        'command' => "#{node['vlg-base']['bin_dir']}/cronscripts-lz-di/upload-turn.sh s3://ttv-hadoop-output/ocs2/ | tee -a #{node['vlg-base']['log_dir']}/upload-turn.append.txt > #{node['vlg-base']['log_dir']}/upload-turn.txt",
    }
end
