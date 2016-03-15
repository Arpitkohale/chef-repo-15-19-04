# packages
default['packages'] = node['packages'] + [ 'mysql', 'mysql-connector-java', 'nscd', 'iperf3' ]

# cloudera version
case node.chef_environment
when "production"
  default['vlg-data-cdh']['cloudera']['version'] = '5.4.6'
when "sandbox"
  default['vlg-data-cdh']['cloudera']['version'] = '5.4.6'
when "development"
  default['vlg-data-cdh']['cloudera']['version'] = '5.4.6'
else
  default['vlg-data-cdh']['cloudera']['version'] = '5.4.6'
end

# ephemeral
default['vlg-ephemeral']['configuration'] = 'jbod'

# swap
default['vlg-swap']['path'] = "/swap"
case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 2048
when "sandbox"
  default['vlg-swap']['size'] = 2048
end

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'data' ] + [ 'vlg' ]

# hosts
default['vlg-base']['manage_etc_hosts'] = 'false'

# dmp
default['vlg-data-cdh']['dmp']['db']['host'] = 'dmp-prod-usor-db.videologygroup.com'
default['vlg-data-cdh']['dmp']['db']['ip'] = '10.193.1.168'

# sysctl
default['sysctl']['params']['vm']['swappiness'] = '1'
default['sysctl']['params']['net']['ipv6']['conf']['all']['disable_ipv6'] = '1'
default['sysctl']['params']['net']['ipv6']['conf']['default']['disable_ipv6'] = '1'
default['sysctl']['params']['net']['ipv6']['conf']['lo']['disable_ipv6'] = '1'
default['sysctl']['params']['net']['ipv4']['tcp_low_latency'] = '1'
default['sysctl']['params']['vm']['nr_hugepages'] = '0'
default['sysctl']['params']['vm']['nr_hugepages_mempolicy'] = '0'
default['sysctl']['params']['vm']['hugepages_treat_as_movable'] = '0'
default['sysctl']['params']['vm']['nr_overcommit_hugepages'] = '0'

# lib
default['vlg-data-cdh']['lib_dir'] = '/usr/lib/videology'
case node.chef_environment
when "sandbox"
  default['vlg-data-cdh']['lib_sync'] = false
else
  default['vlg-data-cdh']['lib_sync'] = true
end

# ntp
if node['hostname'][0...11] == 'usvadtcmprd'
  force_default['ntp']['listen'] = '*'
else
  override['ntp']['servers'] = [ 'usvadtcmprd01', 'usvadtcmprd02', "0.pool.ntp.org", "1.pool.ntp.org" ]
end
