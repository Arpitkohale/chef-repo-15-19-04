# application user
default['vlg-base']['app_user'] = 'vlg'
default['vlg-base']['app_user_home'] = "/home/#{node['vlg-base']['app_user']}"

# location
# Vagrant
if node['hostname'][0...3] == 'vlg'
  default['vlg-base']['location'] = 'vagrant'
end

# US East (N. Virginia)
if node['hostname'][0...4] == 'usva'
  default['vlg-base']['location'] = 'usva'
end

# Washington D.C.
if node['hostname'][0...4] == 'usdc'
  default['vlg-base']['location'] = 'usdc'
end

# US West (N. California)
if node['hostname'][0...4] == 'usca'
  default['vlg-base']['location'] = 'usca'
end

# US West (Oregon)
if node['hostname'][0...4] == 'usor'
  default['vlg-base']['location'] = 'usor'
end

# EU (Ireland)
if node['hostname'][0...4] == 'euir'
  default['vlg-base']['location'] = 'euir'
end

# EU (Frankfurt)
if node['hostname'][0...4] == 'eufr'
  default['vlg-base']['location'] = 'eufr'
end

# Asia Pacific (Singapore)
if node['hostname'][0...4] == 'apsg'
  default['vlg-base']['location'] = 'apsg'
end

# Asia Pacific (Sydney)
if node['hostname'][0...4] == 'apsy'
  default['vlg-base']['location'] = 'apsy'
end

# Asia Pacific (Tokyo)
if node['hostname'][0...4] == 'apty'
  default['vlg-base']['location'] = 'apty'
end

# South America (Sao Paulo)
if node['hostname'][0...4] == 'sasp'
  default['vlg-base']['location'] = 'sasp'
end

# packages
default['packages'] = [ 'strace', 'htop', 'nmap', 'ngrep', 'git', 'vim-enhanced', 'lsof', 'finger', 'nc', 'sysstat', 'mailx', 'man', 'man-pages', 'traceroute', 'tcpdump', 'wget', 'telnet', 'bind-utils', 'screen', 'libselinux-python', 'python-httplib2', 'perl-Digest-SHA', 'perl-URI', 'perl-Compress-Zlib', 'perl-libwww-perl', 'perl-Crypt-SSLeay', 'lockfile-progs' ]
if node.platform == 'amazon'
  default['packages'] = node['packages'] + [ 'perl-Switch', 'perl-Sys-Syslog', 'perl-LWP-Protocol-https' ]
end

# dirs
default['vlg-base']['log_dir'] = "#{node['vlg-base']['app_user_home']}/log"
default['vlg-base']['bin_dir'] = "#{node['vlg-base']['app_user_home']}/bin"
default['vlg-base']['etc_dir'] = "#{node['vlg-base']['app_user_home']}/etc"

# cron
default['vlg-cron']['jobs']['cleanup'] = {
  'time' => '0 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/cleanup.sh >> #{node['vlg-base']['log_dir']}/cleanup/cleanup.`date +\\%Y-\\%m-\\%d`.log",
}

unless Chef::Config[:solo]
default['vlg-cron']['jobs']['aws-monitor'] = {
  'time' => '*/5 * * * *',
  'user' => "#{node['vlg-base']['app_user']}",
  'command' => "#{node['vlg-base']['bin_dir']}/aws-mon-put-instance-data-wrapper.sh > /dev/null 2>&1",
}
end

# sudo
default['authorization']['sudo']['include_sudoers_d'] = 'true'
default['authorization']['sudo']['passwordless'] = 'true'
default['vlg-base']['sudoers']['app_user'] = []

if Chef::Config[:solo]
  default['authorization']['sudo']['groups'] = [ 'vagrant', 'users', "#{node['vlg-base']['app_user']}" ]
end

case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = [ 'wheel' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = [ 'wheel' ]
when "staging"
  default['authorization']['sudo']['groups'] = [ 'wheel' ]
when "sandbox"
  default['authorization']['sudo']['groups'] = [ 'users', "#{node['vlg-base']['app_user']}" ]
end

# nrpe
default['nrpe']['packages'] = %w(nrpe nagios-plugins-procs nagios-plugins-disk nagios-plugins-tcp)
default['nrpe']['allowed_hosts'] = [ '127.0.0.1', '107.20.37.222', '10.200.2.148', '54.86.191.145', '54.174.209.97', '10.194.0.78', '10.193.0.24', '10.195.0.70' ]
default['nrpe']['dont_blame_nrpe'] = 1
default['vlg-base']['nrpe']['check_disk']['warning'] = "20%"
default['vlg-base']['nrpe']['check_disk']['critical'] = "10%"

# ntp
default['ntp']['servers'] = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]

# timezone
default['vlg-base']['timezone'] = 'America/New_York'

# ssh
default['sshd']['sshd_config']['PermitRootLogin'] = 'yes'
default['sshd']['sshd_config']['PasswordAuthentication'] = 'no'
default['sshd']['sshd_config']['GSSAPIAuthentication'] = 'yes'
default['sshd']['sshd_config']['UseDNS'] = 'no'

# dynect
default['vlg-base']['dynect'] = 'ec2_local_ipv4'
default['vlg-base']['dynect_ttl'] = 300
default['dynect']['domain'] = 'inf.videologygroup.com'
default['dynect']['customer'] = 'LucidMedia'
default['dynect']['zone'] = 'inf.videologygroup.com'
unless Chef::Config[:solo]
  data = Chef::EncryptedDataBagItem.load("dynect", "credentials")
  dyn_username = data["username"]
  dyn_password = data["password"]
  default['dynect']['username'] = "#{dyn_username}"
  default['dynect']['password'] = "#{dyn_password}"
end

# python
default['vlg-base']['python']['get_pip_url'] = 'http://s3.amazonaws.com/videologypublic/repo/get-pip.py'

# git
unless Chef::Config[:solo]
  default['vlg-base']['git_host'] = 'git-internal.gio.videologygroup.com'
  default['vlg-base']['git_username'] = 'git_build'
  data = Chef::EncryptedDataBagItem.load("git", "git_build")
  git_password = data["password"]
  default['vlg-base']['git_password'] = "#{git_password}"
  default['vlg-base']['git_url'] = "https://#{node['vlg-base']['git_username']}:#{node['vlg-base']['git_password']}@#{node['vlg-base']['git_host']}"
end

# hipchat
unless Chef::Config[:solo]
  default['hipchat']['handler']['server'] = 'https://api.hipchat.com'
  default['hipchat']['handler']['api_version'] = 'v1'
  data = Chef::EncryptedDataBagItem.load("hipchat", "api")
  default['hipchat']['handler']['token'] = data["token"]
  default['hipchat']['handler']['room'] = 'DevOps Notifications'
  default['hipchat']['handler']['enabled'] = true
end

# hostsfile 
default['vlg-base']['manage_etc_hosts'] = 'true'
default['vlg-base']['hostname_hosts_entry'] = '127.0.1.1'
default['vlg-base']['hostname_hosts_entry_unique'] = false
default['vlg-base']['127.0.1.1'] = 'true'


# rsyslog
default['rsyslog']['protocol'] = 'udp'
unless Chef::Config[:solo]
  default['rsyslog']['server_ip'] = 'syslog.inf.videologygroup.com'
end

# exim
case node.chef_environment
when "production"
  default['vlg-base']['exim']['aliases']['root'] = 'systems@videologygroup.com'
else
  default['vlg-base']['exim']['aliases']['root'] = '/dev/null'
end

unless Chef::Config[:solo]
  default['vlg-base']['exim']['smtp']['host'] = 'email-smtp.us-east-1.amazonaws.com'
end

# authorized_keys
default['vlg-base']['vlg']['ssh']['authorized_keys'] = [
'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC77U4SOVEjrFA3nMmbiW+6q8lUoJVZ9nsA6t9RPQVkunZ9nRhDqquJCgetQ9wVa1WDX/qCpYsNYeLYH/6V1vNnoSAboEi9Bet7TDuetPHCnXDSfIxj5WDmuYwWp9fGvLJ8bUHneXyIpa3Wdj+DT+/Phq91ZcZJVMvCB3JUYExYt4x1W0hNk0N64NznWKDzASFbenwoWKI0HvZMIKenlHnLf8/k7SY1FUWMn9LmTyrGz3xbn0NiODJT1itfYeYenJC/G4dKzBlH7DMA7SYrPYPCuWDGfviAg1Jj01p5pLQpYQn8cmi5ugyiZqUaw5KMrv+WaifE1xD65zlyiPxyyW1X id_rsa_vlg',
'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEApshykKG0cpIYN6lAstudLhfT/V1P/44Keo67tREFO/53dvUdpX37PEtaaCuYAyIyfSEFXDYlVZA5yClTsXgOdYhy8JK2Owtyw9U/rBG9KhIX8RFov2Hqxb7mSYvLgoz7hMef/4CXaSIPHTH8aqW+r0LM2JnZ64l/t6CPjN9Dtcj9DlV1l7jP8JYwSjtJ2r4xrJxytFymCsPWTd7W7PHa7+fcHxAdNRkZtD7VAHDvJYKni4LwnzoiJc0Fw2Ann1Y6ogf6/p7MJlvNi2zRKX92j7oNilElP9Aw6s8UYmb47jvnfx4oTuJYM5kF20GYlM7IYAGtiZbawXIcP4/MbNPPKQ== lucidmedia@mgmt'
]
