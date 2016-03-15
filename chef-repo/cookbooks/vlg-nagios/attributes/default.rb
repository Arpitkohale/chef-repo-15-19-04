# packages
default['packages'] = node['packages'] + [ 'httpd' ] + [ 'php' ] + [ 'nagios-plugins-nrpe' ] + [ 'nagios-plugins-all' ] + [ 'nagios' ]

# repo
default['vlg-nagios']['repo_dir'] = "#{node['vlg-base']['app_user_home']}/nagios"

# nagios
default['vlg-nagios']['spool_dir'] = "/var/spool/nagios"
