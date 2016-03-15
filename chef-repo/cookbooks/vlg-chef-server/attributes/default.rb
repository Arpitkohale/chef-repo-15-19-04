# cron
default['vlg-cron']['jobs']['knife-status-report'] = {
  'time' => '0 0 * * *',
  'user' => "root",
  'command' => "#{node['vlg-base']['bin_dir']}/knife-status-report.sh > /dev/null 2>&1",
}

# packages
default['packages'] = node['packages'] + [ 'redis' ]
