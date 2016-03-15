default['anaconda']['flavor'] = 'x86_64'
default['anaconda']['version'] = '2.0.1'
default['anaconda']['install_root'] = "#{node['vlg-base']['app_user_home']}/anaconda"
default['anaconda']['accept_license'] = 'yes'

default['anaconda']['owner'] = node['vlg-base']['app_user']
default['anaconda']['group'] = node['vlg-base']['app_user']


#I installed these packages on 102.10.16.125:
#libpqxx-devel
#python-devel
#python33-python-devel

#default['packages'] = node['packages'] + [ 'unixODBC', 'postgresql-odbc', 'python-psycopg2', 'pyodbc', 'nodejs-pg', 'python-devel', 'libodb-pgsql', 'libodb-pgsql-devel', 'postgresql', 'postgresql-libs', 'postgresql-devel', 'freetds' ]

# psycopg 2.6 package
default['psycopg2']['version'] = '2.6'
default['psycopg2']['download_url'] = 'http://initd.org/psycopg/tarballs/PSYCOPG-2-6/psycopg2-2.6.tar.gz'
default['psycopg2']['install_dir'] = '/usr/local'
default['psycopg2']['home_dir'] = '/usr/local/psycopg2'

default['anaconda']['etc_dir'] = '/etc'

