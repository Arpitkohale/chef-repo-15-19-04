# mysql
default['vlg-all-in-one']['mysql_root_password'] = 'dmp'
default['vlg-all-in-one']['mysql_user'] = 'dmp'

# couchbase
default['couchbase']['server']['memory_quota_mb'] = 1024

# kafka
default['vlg-kafka']['jvm_heap'] = "128m"

# solr
default['vlg-solr']['java']['mem'] = '128m'
default['vlg-all-in-one']['solr']['config_dir'] = "/data/solr-conf"
