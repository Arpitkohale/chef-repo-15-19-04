# packages
default['packages'] = node['packages'] +  [ 'npm' ] + [ 'nodejs' ] + [ 'mysql' ]

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

data = Chef::EncryptedDataBagItem.load("lz", "db")
default['vlg-lz-jb']['lucidmedia-password'] = data["lucidmedia-password"]

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]

if node['hostname'] == 'usorlzjbprd01'
  default['vlg-cron']['jobs']['vlg-lz-jb-mysql-production-dump'] = {
      'time' => '10 * * * *',
      'command' => '/usr/bin/mysqldump --host=dmp-prod-usor-db.videologygroup.com --complete-insert --single-transaction --routines dmp > /data/dmp-prod-dump.sql && s3cmd -q put /data/dmp-prod-dump.sql s3://videologypublic/dmpprodmysqldump/dmp-prod-dump.sql 2>/dev/null 1>/dev/null',
  }
end
