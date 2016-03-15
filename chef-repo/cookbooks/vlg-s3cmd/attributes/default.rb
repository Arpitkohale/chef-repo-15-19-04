# s3cmd
default['vlg-s3cmd']['version'] = '1.5.2'
default['vlg-s3cmd']['install_url'] = "http://s3.amazonaws.com/videologypublic/repo/s3cmd-#{node['vlg-s3cmd']['version']}.tar.gz"
default['vlg-s3cmd']['checksum'] = '3153116dc62c817a724ea58080968383'

# packages
default['packages'] = node['packages'] + [ 'python-magic' ]
