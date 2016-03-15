default['vlg-storm']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-storm']['group'] = "#{node['vlg-base']['app_user']}"

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# storm defaults
default['vlg-storm']['version'] = '0.9.4'
default['vlg-storm']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-storm-0.9.4.tar.gz'

default['vlg-storm']['install_dir'] = '/usr/local'
default['vlg-storm']['home_dir'] = "#{node['vlg-storm']['install_dir']}/storm"
default['vlg-storm']['storm_pid'] = "#{node['vlg-storm']['home_dir']}/storm.pid"
default['vlg-storm']['conf_dir'] = "#{node['vlg-storm']['home_dir']}/conf"
default['vlg-storm']['lib_dir'] = "#{node['vlg-storm']['home_dir']}/lib"
default['vlg-storm']['bin_dir'] = "#{node['vlg-storm']['home_dir']}/bin"
default['vlg-storm']['log_dir'] = "#{node['vlg-base']['log_dir']}/storm"
default['vlg-storm']['aws_datacenter'] = 'datacenter.dmp.localhost'
default['vlg-storm']['zookeeper_quorum'] = false
default['vlg-storm']['nimbus']['server'] = 'localhost'

# storm-graphite defaults
default['vlg-storm']['graphite']['host'] = 'graphite.inf.videologygroup.com'
default['vlg-storm']['graphite']['port'] = '2003'
default['vlg-storm']['graphite']['prefix'] = "vlg.eliza.storm.#{node.chef_environment}"

default['vlg-storm']['storm-graphite']['enabled'] = true

default['vlg-storm']['storm-graphite']['install_dest'] = "#{node['vlg-storm']['lib_dir']}/storm-graphite-0.2.3-SNAPSHOT-all.jar"
default['vlg-storm']['storm-graphite']['url']        = 'http://s3.amazonaws.com/videologypublic/repo/storm-graphite-0.2.3-SNAPSHOT-all.jar'
default['vlg-storm']['storm-graphite']['checksum']   = '22b6e9016c200b1ae93618b457d5f0a084451be2b80c33fee41aa19b92407295'
