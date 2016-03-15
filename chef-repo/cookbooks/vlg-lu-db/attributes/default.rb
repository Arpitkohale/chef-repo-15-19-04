# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# db backup dir
default['vlg-lu-db']['backup_dir'] = "#{node['vlg-ephemeral']['striped']['root']}/backup"

# cron
case node.chef_environment
when "production"
  default['vlg-cron']['jobs']['lu-db-backup'] = {
    'time' => '0 */3 * * *',
    'user' => "#{node['vlg-base']['app_user']}",
    'command' => "#{node['vlg-base']['bin_dir']}/lu-db-backup.sh >> #{node['vlg-base']['log_dir']}/lu-db-backup/lu-db-backup.`date +\\%Y-\\%m-\\%d`.log",
  }
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

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
end

# mysql
case node.chef_environment
when "production"
  data = Chef::EncryptedDataBagItem.load("lu", "db")
  mysql_root_password = data["root-password"]
  mysql_version = '5.6'
  mysql_innodb_buffer_pool_size = '50G'
when "endtoend"
  data = Chef::EncryptedDataBagItem.load("lu", "db")
  mysql_root_password = data["root-password"]
  mysql_version = '5.6'
  mysql_innodb_buffer_pool_size = '5G'
when "staging"
  data = Chef::EncryptedDataBagItem.load("lu", "db")
  mysql_root_password = data["root-password"]
  mysql_version = '5.6'
  mysql_innodb_buffer_pool_size = '5G'
else
  mysql_root_password = "ngKkj8Wmhb"
  mysql_version = '5.6'
  mysql_innodb_buffer_pool_size = '5G'
end
default['vlg-lu-db']['mysql_service_name'] = "ludb"
default['vlg-lu-db']['mysql_root_password'] = "#{mysql_root_password}"
default['vlg-lu-db']['mysql_version'] = "#{mysql_version}"
default['vlg-lu-db']['mysql_data_dir'] = "#{node['vlg-ephemeral']['striped']['root']}/#{node['vlg-lu-db']['mysql_service_name']}"
default['vlg-lu-db']['mysql_port'] = '3306'
default['vlg-lu-db']['mysql_bind_address'] = '0.0.0.0'
default['vlg-lu-db']['mysql_innodb_buffer_pool_size'] = "#{mysql_innodb_buffer_pool_size}"
