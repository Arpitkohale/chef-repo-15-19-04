set['build_essential']['compiletime'] = true

default['stash']['home_path']    = '/var/atlassian/application-data/stash'
default['stash']['install_path'] = '/opt/atlassian'
default['stash']['install_type'] = 'standalone'
default['stash']['service_type'] = 'init'
default['stash']['url_base']     = 'http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash'
default['stash']['user']         = 'stash'
default['stash']['version']      = '3.10.0'
default['stash']['url']      = "#{node['stash']['url_base']}-#{node['stash']['version']}.tar.gz"
default['stash']['checksum'] = 'ab7fecb10e6650fb5b94a20b22463771d7ab0f69a0971272d1a066dd2430f048'