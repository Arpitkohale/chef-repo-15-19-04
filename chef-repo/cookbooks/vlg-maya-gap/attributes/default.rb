default['nodejs']['install_method'] = 'binary'

default['packages'] = node['packages'] + [ 'ruby', 'mysql', 'mysql-devel', 'mysql-libs', 'php', 'php-mysql', 'php-gd', 'php-pear', 'php-xml', 'php-mbstring', 'php-mcrypt', 'php-soap' ]