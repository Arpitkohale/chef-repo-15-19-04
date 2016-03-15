# java
default['java']['jdk_version'] = '8'
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'rnd' ]

default['packages'] = node['packages'] + [ 'R' ]
