# memcached
case node.chef_environment
when "production"
  default['vlg-lu-mc']['memcached_size'] = '1024'
when "staging"
  default['vlg-lu-mc']['memcached_size'] = '1024'
when "sandbox"
  default['vlg-lu-mc']['memcached_size'] = '1024'
else
  default['vlg-lu-mc']['memcached_size'] = '64'
end
default['vlg-lu-mc']['memcached_port'] = '11222'

# packages
default['packages'] = node['packages'] + [ 'memcached' ]
