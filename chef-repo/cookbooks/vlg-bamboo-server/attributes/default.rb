# bamboo
default[:bamboo][:version] = '5.9.4'
default[:bamboo][:checksum] = '8905a4750ca6d73feefbcc58d91e05be3bd60e2c60ca422f092a080f7263bdb2'
default[:bamboo][:download_url]                   = "http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-#{node[:bamboo][:version]}.tar.gz"

#s3cmd version
default['vlg-s3cmd']['checksum'] = 'ff8a6764e8bdd7ed48a93e51b08222bea33469d248a90b8d25315b023717b42d'
# mysql
data = Chef::EncryptedDataBagItem.load("bamboo-server", "db")
mysql_root_password = data["root-password"]
default[:mysql][:server_root_password] = "#{mysql_root_password}"

#aws config file
default['vlg-base']['app_user'] = 'bamboo'
default['vlg-base']['app_user_home'] = '/home/bamboo'
#bamboo_cron
default['bamboo']['cron']['day'] = '*'
default['bamboo']['cron']['hour'] = '*'
default['bamboo']['cron']['minute'] = '0'
default['bamboo']['cron']['month'] = '*'
default['bamboo']['cron']['weekday'] = '*'

#bamboo_cron_command
default['bamboo']['cron']['command'] = '/usr/bin/s3cmd'
default['bamboo']['cron']['command_opt'] = 'sync'
default['bamboo']['cron']['source_path'] = '/build/bamboo-home/xml-data/builds/'
default['bamboo']['cron']['dest_path'] = 's3://bamboo-buildlogs/'


