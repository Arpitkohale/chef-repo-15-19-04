# rsyslog
default['vlg-syslog-server']['data_mount'] = '/data'
default['rsyslog']['log_dir'] = "#{node['vlg-syslog-server']['data_mount']}/syslog"
default['rsyslog']['group'] = 'users'
