# maven
force_override['maven']['version'] = 3
force_override['maven']['3']['version'] = '3.2.3'
force_override['maven']['3']['url'] = 'https://archive.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz'
force_override['maven']['3']['checksum'] = 'bf3f04aadee3a67158aebdfb0b4cb022063329d459d10fd6b4b02223e10aa8ed'
default['vlg-all-in-one']['maven']['data_dir'] = "/data/maven"

# mysql
default['vlg-all-in-one']['mysql_version'] = "5.6"
default['vlg-all-in-one']['mysql_data_dir'] = "/data/mysql"
default['vlg-all-in-one']['mysql_port'] = "3306"
default['vlg-all-in-one']['mysql_bind_address'] = "0.0.0.0"
default['vlg-all-in-one']['mysql_innodb_buffer_pool_size'] = "1GB"

# memcached
default['memcached']['port'] = '11222'

# packages
default['packages'] = node['packages'] + [ 'protobuf', 'protobuf-compiler', 'protobuf-devel', 'nodejs' ]

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# couchbase
default['couchbase']['server']['data_dir'] = "/data/couchbase"
default['vlg-couchbase']['package_file'] = "couchbase-server-community-3.0.1-centos6.x86_64.rpm"
default['vlg-couchbase']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/couchbase-server-community-3.0.1-centos6.x86_64.rpm"
default['couchbase']['server']['username'] = "admin"
default['couchbase']['server']['password'] = "default"

#kafka
default['vlg-kafka']['topic_names'] = "kafka.dmp.storm.updates.queue:40:1,kafka.dmp.storm.fastlane:40:1"
