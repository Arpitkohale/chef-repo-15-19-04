# ephemeral
default['vlg-ephemeral']['configuration'] = 'disable'

# proftpd
default['proftpd']['conf']['use_ipv6'] = false
default['proftpd']['conf']['ident_lookups'] = false
default['proftpd']['conf']['server_name'] = 'Videology Group FTP server'
default['proftpd']['conf']['DefaultRoot'] = '~/ftproot'
default['proftpd']['conf']['passive_ports'] = '10090 10100'
default['proftpd']['conf']['default_address'] = node['ec2']['public_ipv4']
default['proftpd']['conf']['if_module']['tls']['prefix'] = 'TLS'
default['proftpd']['conf']['if_module']['tls']['engine'] = true
default['proftpd']['conf']['if_module']['tls']['log'] = '/var/log/proftpd/tls.log'
default['proftpd']['conf']['if_module']['tls']['protocol'] = 'SSLv3 TLSv1'
default['proftpd']['conf']['if_module']['tls']['required'] = false
default['proftpd']['conf']['if_module']['tls']['CA_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle_sha2.crt'
default['proftpd']['conf']['if_module']['tls']['rsa_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
default['proftpd']['conf']['if_module']['tls']['rsa_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
default['proftpd']['conf']['if_module']['tls']['verify_client'] = false
default['proftpd']['conf']['if_module']['tls']['options'] = 'NoCertRequest EnableDiags NoSessionReuseRequired'
default['proftpd']['conf']['if_module']['tls']['renegotiate'] = 'none'

# vlg-data-ftp
default['vlg-data-ftp']['data_root'] = '/data'
default['vlg-data-ftp']['ftp_root'] = "#{node['vlg-data-ftp']['data_root']}/ftp"

# sshd
default['sshd']['sshd_config']['Subsystem'] = 'sftp internal-sftp'
default['sshd']['sshd_config']['PasswordAuthentication'] = 'yes'
default['sshd']['sshd_config']['Match'] = {
  'Group ftpusers' => {
    'ChrootDirectory' => "#{node['vlg-data-ftp']['ftp_root']}/%u",
    'ForceCommand' => 'internal-sftp'
  }
}

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ]
end
default['vlg-data-ftp']['sudoers']['nagios'] = [ '/bin/find /data/ftp/ -type f -mmin +120' ]

# cron
if node.chef_environment == "production"
default['vlg-cron']['jobs']['doubleverify-ftp-upload-to-s3'] = {
  'time' => '*/5 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/data/doubleverify-ftp-upload-to-s3.sh >> #{node['vlg-base']['log_dir']}/doubleverify-ftp-upload-to-s3/doubleverify-ftp-upload-to-s3.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
default['vlg-cron']['jobs']['liverampm-ftp-upload-to-s3'] = {
  'time' => '*/5 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/data/liverampm-ftp-upload-to-s3.sh >> #{node['vlg-base']['log_dir']}/liverampm-ftp-upload-to-s3/liverampm-ftp-upload-to-s3.`date +\\%Y-\\%m-\\%d`.log 2>&1",
}
end
