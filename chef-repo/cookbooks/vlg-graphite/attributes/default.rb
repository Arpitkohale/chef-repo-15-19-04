# graphite
default['vlg-graphite']['home'] = '/opt/graphite'
default['vlg-graphite']['user'] = node['vlg-base']['app_user']
default['vlg-graphite']['group'] = node['vlg-base']['app_user']
default['vlg-graphite']['vhost'] = 'graphite.inf.videologygroup.com'

# python pip packages
default['vlg-graphite']['python_pip_packages'] = [ 'python-memcached', 'pysqlite', 'uwsgi', 'django-tagging', 'Twisted', 'pytz' ]

# memcached
default['vlg-graphite']['memcached_size'] = '256'

# packages
default['packages'] = node['packages'] + [ 'nginx', 'bitmap-fonts-compat', 'bitmap', 'fontconfig', 'memcached', 'pycairo', 'sqlite-devel', 'daemonize', 'mongodb-server' ]

# cron
default['vlg-cron']['jobs']['graphite-build-index'] = {
  'time' => '0 * * * *',
  'user' => node['vlg-graphite']['user'],
  'command' => "#{node['vlg-graphite']['home']}/bin/build-index.sh >> #{node['vlg-graphite']['home']}/storage/log/build-index/build-index.`date +\\%Y-\\%m-\\%d`.log",
}
if node.chef_environment == 'production'
default['vlg-cron']['jobs']['graphite-carbon-monitor'] = {
  'time' => '*/5 * * * *',
  'user' => node['vlg-graphite']['user'],
  'command' => "/usr/bin/timeout 300 #{node['vlg-base']['bin_dir']}/graphite/carbon-monitor.sh > /dev/null 2>&1",
}
default['vlg-cron']['jobs']['grafana-backup'] = {
  'time' => '0 0 * * *',
  'user' => node['vlg-graphite']['user'],
  'command' => "#{node['vlg-base']['bin_dir']}/graphite/grafana-backup.sh > /dev/null 2>&1",
}
end

# uwsgi
default['vlg-graphite']['uwsgi']['socket'] = '127.0.0.1:8000'
default['vlg-graphite']['uwsgi']['workers'] = '8'
default['vlg-graphite']['uwsgi']['harakiri']['timeout'] = '300'
default['vlg-graphite']['uwsgi']['pid'] = '/var/run/uwsgi/uwsgi.pid'
default['vlg-graphite']['uwsgi']['max']['requests'] = '5000'

# nginx
default['vlg-graphite']['nginx']['worker']['processes'] = '4'
default['vlg-graphite']['nginx']['worker']['connections'] = '1024'
default['vlg-graphite']['nginx']['uwsgi']['read']['timeout'] = '300'

# grafana
default['vlg-graphite']['grafana']['vhost'] = 'grafana.inf.videologygroup.com'
default['vlg-graphite']['grafana']['version'] = '2.1.1-1'

# seyren
default['vlg-graphite']['seyren']['conf'] = '/etc/seyren.conf'
default['vlg-graphite']['seyren']['wrapper'] = '/usr/local/bin/seyren.sh'
default['vlg-graphite']['seyren']['mongo']['url'] = 'mongodb://localhost:27017/seyren'
default['vlg-graphite']['seyren']['vhost'] = 'seyren.inf.videologygroup.com'
default['vlg-graphite']['seyren']['log']['path'] = '/var/log/seyren/'
default['vlg-graphite']['seyren']['log']['file']['level'] = 'info'
default['vlg-graphite']['seyren']['smtp']['from'] = 'seyren@videologygroup.com'
data = Chef::EncryptedDataBagItem.load("hipchat", "api")
default['vlg-graphite']['seyren']['hipchat']['authtoken'] = data["token"]
default['vlg-graphite']['seyren']['hipchat']['username'] = 'Seyren Alert'
default['vlg-graphite']['seyren']['download']['url'] = 'http://s3.amazonaws.com/videologypublic/repo/seyren-1.2.1.jar'
default['vlg-graphite']['seyren']['location'] = '/usr/local/lib/seyren.jar'
default['vlg-graphite']['seyren']['port'] = '8080'

# swap
default['vlg-swap']['enable'] = false
