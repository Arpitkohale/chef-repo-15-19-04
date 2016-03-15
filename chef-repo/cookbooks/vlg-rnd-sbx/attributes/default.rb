# java
default['java']['jdk_version'] = '8'
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'rnd' ]

default['packages'] = node['packages'] + [ 'qt', 'qt-sqlite', 'qt-x11', 'qt3', 'mysql', 'mysql-devel', 'mysql-libs', 'mysql-server', 'fuse', 'fuse-devel', 'fuse-libs', 'at', 'numpy', 'numpy-f2py', 'obex-data-server', 'obexd', 'oddjob', 'oddjob-mkhomedir', 'openjpeg-libs', 'oprofile', 'orca', 'perl-Archive-Extract', 'perl-Archive-Tar', 'perl-CGI', 'perl-CPAN', 'perl-CPANPLUS', 'perl-Compress-Raw-Bzip2', 'apr', 'autofs', 'bc', 'bison-devel', 'blas', 'brasero', 'cloud-init', 'cpuspeed', 'crash', 'cvs', 'diffstat', 'dos2unix', 'gcalctool', 'ftp', 'gd', 'httpd', 'httpd-tools', 'iftop', 'inotify-tools', 'ruby', 'ruby-libs', 'zip' ]

default['vlg-rundeck']['s3_pkg_url'] = "http://s3.amazonaws.com/videologypublic/repo"