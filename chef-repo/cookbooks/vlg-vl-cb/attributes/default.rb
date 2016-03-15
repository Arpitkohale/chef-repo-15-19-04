# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# datadog
default['datadog']['tags'] = 'Eliza'

# swap
case node.chef_environment
when "production"
  force_override['vlg-swap']['size'] = 122880
when "sandbox"
  force_override['vlg-swap']['size'] = 10240
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end

# couchbase
default['vlg-vl-cb']['data_dir'] = "/data"

force_default['couchbase']['server']['package_file'] = "couchbase-server-community-2.2.0-centos6.x86_64.rpm"
force_default['couchbase']['server']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/couchbase-server-community-2.2.0-centos6.x86_64.rpm"

force_default['couchbase']['server']['password'] = "V!d3ology"
force_default['couchbase']['server']['username'] = "Administrator"
