# user/group
default['vlg-solr']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-solr']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-solr']['version'] = '4.2.10'
default['vlg-solr']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/solr-4.10.2.tar.gz'
default['vlg-solr']['install_dir'] = '/usr/local/solr'
default['packages'] = node['packages'] + [ 'openssl-devel' ]

#java
default['vlg-solr']['java']['mem'] = '512m'

# solr
default['vlg-solr']['base_dir'] = "#{node['vlg-solr']['install_dir']}/example"
default['vlg-solr']['home_dir'] = "#{node['vlg-base']['app_user_home']}/solr"
default['vlg-solr']['lib_dir'] = "#{node['vlg-base']['app_user_home']}/solr-libs" #do not change! hardcoded in solconfig.xml
default['vlg-solr']['logs_dir'] = '/var/log/solr'
default['vlg-solr']['zookeeper']['host'] = 'localhost:2181'
default['vlg-solr']['sql']['host'] = 'jdbc:mysql://localhost:3306/dmp'
default['vlg-solr']['sql']['user'] = 'dmp'
default['vlg-solr']['sql']['pass'] = 'dmp'
