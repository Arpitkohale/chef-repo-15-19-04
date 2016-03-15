# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

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
default['vlg-tomcat']['port_8443']['enable'] = 'false'
default['vlg-tomcat']['port_8444']['enable'] = 'false'
default['vlg-tomcat']['port_8445']['enable'] = 'false'
default['vlg-tomcat']['max_threads'] = '64'
default['vlg-tomcat']['min_spare_threads'] = '64'
default['vlg-tomcat']['doc_base'] = 'dsp.war'
case node.chef_environment
when "production"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
when "endtoend"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
when "staging"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
when "sandbox"
  default["vlg-tomcat"]["jvm_heap"] = "5g"
end

default['vlg-tomcat']['app_deployment'] = 'standard'

case node.chef_environment
when "production"
  default['vlg-tomcat']['maya_db_datacenter'] = 'production'
  case node['vlg-base']['location']
  when "usva"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.us.virginia'
  when "usor"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.us.oregon'
  when "euir"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.eu.ireland'
  when "apsg"
    default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.ap.singapore'
  end
when "endtoend"
  default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.endtoend'
  default['vlg-tomcat']['maya_db_datacenter'] = 'endtoend'
when "staging"
  default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.staging'
  default['vlg-tomcat']['maya_db_datacenter'] = 'sandbox'
when "sandbox"
  default['vlg-tomcat']['aws_datacenter'] = 'aws.dsp.sandbox'
  default['vlg-tomcat']['maya_db_datacenter'] = 'regression'
else
  default['vlg-tomcat']['aws_datacenter'] = 'vagrant'
  default['vlg-tomcat']['maya_db_datacenter'] = 'vagrant'
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
end

# swap
case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 32768
when "endtoend"
  default['vlg-swap']['size'] = 32768
when "staging"
  default['vlg-swap']['size'] = 32768
when "sandbox"
  default['vlg-swap']['size'] = 32768
end

# cron
unless Chef::Config[:solo]
default['vlg-cron']['jobs']['lu-cm-log-pusher'] = {
  'time' => '*/10 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/lu-log-pusher.sh >> #{node['vlg-base']['log_dir']}/lu-log-pusher/lu-log-pusher.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['lu-cm-tomcat-archiver'] = {
  'time' => '*/10 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/tomcat-archiver.sh >> #{node['vlg-base']['log_dir']}/tomcat-archiver/tomcat-archiver.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
end
