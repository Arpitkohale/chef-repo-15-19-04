# ephemeral
default['vlg-ephemeral']['configuration'] = 'disable'

# java
default['java']['jdk_version'] = '8'
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# tomcat
default["vlg-tomcat"]["jvm_heap"] = "1g"
default['vlg-tomcat']['doc_base'] = 'dts-api.war'
default['vlg-tomcat']['max_keep_alive_requests'] = '128'
default['vlg-tomcat']['keep_alive_timeout'] = '100'
default['vlg-tomcat']['port_8080']['protocol'] = 'org.apache.coyote.http11.Http11NioProtocol'

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ] 
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ] 
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ] 
end
default['vlg-base']['sudoers']['app_user'] = node['vlg-base']['sudoers']['app_user'] + [ '/home/vlg/bin/data/fix-fte-permissions.sh' ]

# vlg-data-normalizer
default['vlg-data-normalizer']['data_root'] = "/data"
default['vlg-data-normalizer']['provider_root'] = "#{node['vlg-data-normalizer']['data_root']}/provider"
default['vlg-data-normalizer']['normalizer_output'] = "/normalizer-output"
default['vlg-data-normalizer']['bin_dir'] = "#{node['vlg-base']['app_user_home']}/app-fte-normalizer"

# timezone
default['vlg-base']['timezone'] = 'UTC'

# sshd
default['sshd']['sshd_config']['Subsystem'] = 'sftp internal-sftp'
default['sshd']['sshd_config']['PasswordAuthentication'] = 'yes'
default['sshd']['sshd_config']['Match'] = {
  'Group sftpusers' => {
    'ChrootDirectory' => "#{node['vlg-data-normalizer']['provider_root']}/%u",
    'ForceCommand' => 'internal-sftp'
  }
}

# cron
case node.chef_environment
when "production"
default['vlg-cron']['jobs']['dt-nl-s3-backup'] = {
  'time' => '40 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-backup.sh >> #{node['vlg-base']['log_dir']}/dt-nl-s3-backup/s3-backup.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-s3-normalized'] = {
  'time' => '40 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-normalized.sh >> #{node['vlg-base']['log_dir']}/dt-nl-s3-nl/s3-normalized.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-s3-nl-logs'] = {
  'time' => '45 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-normalizer-logs.sh >> #{node['vlg-base']['log_dir']}/dt-nl-s3-nl-logs/s3-nl.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-s3-puller-exelate'] = {
  'time' => '50 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-puller.sh us exelate s3://vg-s2s-us/ftp-normalizer-backup /normalizer-output/pseudo/exelate >> #{node['vlg-base']['log_dir']}/dt-nl-s3-puller-exelate/s3-puller-us-exelate.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-s3-puller-turbine'] = {
  'time' => '50 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-puller-turbine.sh us >> #{node['vlg-base']['log_dir']}/dt-nl-s3-puller-turbine/s3-puller-turbine-us.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-bad-files'] = {
  'time' => '45 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/s3-badfiles.sh >> #{node['vlg-base']['log_dir']}/dt-nl-bad-files/s3-badfiles.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-fte-normalizer'] = {
  'time' => '10 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-data-normalizer']['bin_dir']}/fte-normalizer-wrapper.sh >> #{node['vlg-base']['log_dir']}/dt-nl-fte-nl/fte-normalizer.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['dt-nl-stale-check'] = {
  'time' => '0 22 * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/data_stale_file_check.sh addthis,adobe,crosspixel,excelate,eyeota,hmedia,liveramp,weboramaemea >> #{node['vlg-base']['log_dir']}/dt-nl-stale-check/data_stale_file_check.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
end
