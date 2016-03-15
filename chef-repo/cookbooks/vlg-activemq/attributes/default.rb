# user/group
default['vlg-activemq']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-activemq']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-activemq']['version'] = '5.10.0'
default['vlg-activemq']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-activemq-5.10.0-bin.tar.gz'
default['vlg-activemq']['install_dir'] = '/usr/local'

# activemq
default['vlg-activemq']['base_dir'] = "#{node['vlg-base']['app_user_home']}/activemq"
default['vlg-activemq']['conf_dir'] = "#{node['vlg-activemq']['base_dir']}/conf"
default['vlg-activemq']['data_dir'] = "#{node['vlg-activemq']['base_dir']}/data"
default['vlg-activemq']['tmp_dir'] = "#{node['vlg-activemq']['base_dir']}/tmp"
default['vlg-activemq']['home'] = "#{node['vlg-activemq']['install_dir']}/activemq"
default['vlg-activemq']['pid'] = "#{node['vlg-activemq']['data_dir']}/activemq-#{node['fqdn']}.pid"

# activemq: jetty
default['vlg-activemq']['jetty']['port'] = '8162'

# java
default['vlg-activemq']['jvm_heap'] = '128m'
