# couchbase
default['vlg-couchbase']['package_file'] = "couchbase-server-community-3.0.1-centos6.x86_64.rpm"
default['vlg-couchbase']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/couchbase-server-community-3.0.1-centos6.x86_64.rpm"
default['vlg-couchbase']['data_dir'] = "/cb-data"
default['vlg-couchbase']['user'] = 'couchbase'
default['vlg-couchbase']['group'] = 'couchbase'

data = Chef::EncryptedDataBagItem.load("lz", "cb")
# TODO: implement REST API calls for updating users-passwords on live clusters in vlg-lz-cb-r32x/recipes/setup.rb

case node.chef_environment
  when "production"
    default['vlg-couchbase']['server']['username_ro'] = data["production_username_ro"]
    default['vlg-couchbase']['server']['password_ro'] = data["production_password_ro"]
  when "staging"
    default['vlg-couchbase']['server']['username_ro'] = data["staging_username_ro"]
    default['vlg-couchbase']['server']['password_ro'] = data["staging_password_ro"]
  when "sandbox"
    default['vlg-couchbase']['server']['username_ro'] = data["sandbox_username_ro"]
    default['vlg-couchbase']['server']['password_ro'] = data["sandbox_password_ro"]
  else #vagrant
    default['vlg-couchbase']['server']['username_ro'] = "vagrant"
    default['vlg-couchbase']['server']['password_ro'] = "vagrant"
end

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]

# hostsfile
default['vlg-base']['hostname_hosts_entry'] = node['ipaddress']
default['vlg-base']['hostname_hosts_entry_unique'] = true

#swap 
default['vlg-swap']['size'] = 10240
default['sysctl']['params']['vm']['swappiness'] = 0

#EBS
default['vlg-lz-cb-r32x']['ebs_data_size'] = 300
default['vlg-lz-cb-r32x']['ebs_iops'] = 4000
