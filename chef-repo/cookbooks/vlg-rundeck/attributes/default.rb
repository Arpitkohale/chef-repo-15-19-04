# mysql
if node.chef_environment == "production"
  data = Chef::EncryptedDataBagItem.load("rundeck", "mysql")
  default['vlg-rundeck']['mysql']['username'] = 'rundeck'
  default['vlg-rundeck']['mysql']['password'] = data['password']
  default['vlg-rundeck']['mysql']['host'] = 'rundeck.cobc0exu4crl.us-east-1.rds.amazonaws.com'
else
  default['vlg-rundeck']['mysql']['username'] = 'root'
  default['vlg-rundeck']['mysql']['password'] = 'w4PGjZXTDJ'
  default['vlg-rundeck']['mysql']['host'] = '127.0.0.1'
end
default['vlg-rundeck']['mysql']['name'] = 'rundeck'
default['vlg-rundeck']['mysql']['port'] = '3306'
default['vlg-rundeck']['mysql']['version'] = '5.6'
default['vlg-rundeck']['mysql']['bind_address'] = '127.0.0.1'

# java
default['java']['jdk']['7']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-7u75-linux-x64.tar.gz"
default['java']['jdk']['7']['x86_64']['checksum'] = "6f1f81030a34f7a9c987f8b68a24d139"
default['java']['jdk_version'] = '7'
default['vlg-java']['unlimited_jce_policy_url'] = 'http://s3.amazonaws.com/videologypublic/repo/UnlimitedJCEPolicyJDK7'

# rundeck
default['vlg-rundeck']['package_file'] = "latest.rpm"
default['vlg-rundeck']['package_full_url'] = "http://repo.rundeck.org/latest.rpm"
default['vlg-rundeck']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-rundeck']['from_address'] = 'rundeck@videologygroup.com'
case node.chef_environment
when "production"
  default['vlg-rundeck']['server_url'] = 'rundeck.inf.videologygroup.com'
when "endtoend"
  default['vlg-rundeck']['server_url'] = 'rundeckete.inf.videologygroup.com'
when "sandbox"
  default['vlg-rundeck']['server_url'] = 'rundecksbx.inf.videologygroup.com'
else
  default['vlg-rundeck']['server_url'] = node['fqdn']
end

# cron
if node.chef_environment == "production"
  default['vlg-cron']['jobs']['rundeck-db-backup'] = {
    'time' => '0 */3 * * *',
    'user' => "#{node['vlg-base']['app_user']}",
    'command' => "#{node['vlg-base']['bin_dir']}/rundeck-db-backup.sh >> #{node['vlg-base']['log_dir']}/rundeck-db-backup/rundeck-db-backup.`date +\\%Y-\\%m-\\%d`.log",
  }
end

# dirs
default['vlg-rundeck']['backup_dir'] = "#{node['vlg-ephemeral']['striped']['root']}/backup"
default['vlg-rundeck']['etl_scripts_dir'] = "#{node['vlg-base']['app_user_home']}/etlscripts"
default['vlg-rundeck']['digitalEnvoy_scripts_dir'] = "#{node['vlg-base']['app_user_home']}/digitalEnvoy"

# pip
default['vlg-rundeck']['python_pip_packages'] = [ 'boto', 'dogapi' ]

# sudoers
default['vlg-base']['sudoers']['app_user'] = node['vlg-base']['sudoers']['app_user'] + [ '/usr/bin/chef-client', '/usr/bin/knife status -c /etc/chef/knife.rb --hide-healthy', '/usr/bin/knife diff --chef-repo-path ./ -c /etc/chef/knife.rb --name-only --name-status', '/usr/bin/knife search *' ]

# timezone
default['vlg-base']['timezone'] = 'UTC'

# packages
# install mysql in the production environment... all other environments get the mysql cookbook which comes with the mysql-community-client package
case node.chef_environment
when "production"
  default['packages'] = node['packages'] + [ 'mysql' ]
end
default['packages'] = node['packages'] + [ 'dos2unix' ]

# swap
case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 65536
when "endtoend"
  default['vlg-swap']['size'] = 65536
when "staging"
  default['vlg-swap']['size'] = 65536
when "sandbox"
  default['vlg-swap']['size'] = 10240
end

# Cpan Packages
default['vlg-rundeck']['cpan_modules'] = [ 'DBI', 'DBD::ODBC' ]

default['vlg-rundeck']['s3_pkg_url'] = "http://s3.amazonaws.com/videologypublic/repo"

# winrm plugin
default['vlg-rundeck']['winrm']['jar']['version'] = '1.3.1'
default['vlg-rundeck']['winrm']['jar']['url'] = "https://s3.amazonaws.com/videologypublic/repo/rundeck-winrm-plugin-#{node['vlg-rundeck']['winrm']['jar']['version']}.jar"
default['vlg-rundeck']['winrm']['jar']['checksum'] = 'd08ed7039ab03ac5fc3e859eae53363c4bfd553bf52ed6e46bcc712a2e0ca0ba'

# appdev
case node.chef_environment
when "production"
  default['vlg-rundeck']['appdev']['tv']['nielsen_ingest_host'] = 'usvaadtvprd01.inf.videologygroup.com'
when "endtoend"
  default['vlg-rundeck']['appdev']['tv']['nielsen_ingest_host'] = 'usvaadtvete01.inf.videologygroup.com'
when "sandbox"
  default['vlg-rundeck']['appdev']['tv']['nielsen_ingest_host'] = 'usvaadtvsbx01.inf.videologygroup.com'
else
  default['vlg-rundeck']['appdev']['tv']['nielsen_ingest_host'] = 'localhost'
end
default['vlg-rundeck']['appdev']['tv']['etlhost'] = 'usvadtetlprd.inf.videologygroup.com'
