# memcached

case node.chef_environment
when "production"
  default['vlg-opt-lite-mc']['memcached_size'] = '1024'
when "staging"
  default['vlg-opt-lite-mc']['memcached_size'] = '1024'
when "sandbox"
  default['vlg-opt-lite-mc']['memcached_size'] = '1024'
else
  default['vlg-opt-lite-mc']['memcached_size'] = '64'
end

# packages
default['packages'] = node['packages'] + [ 'memcached' ]

#nrpe
default['vlg-opt']['nrpe']['check_mem']['warning'] = "80"
default['vlg-opt']['nrpe']['check_mem']['critical'] = "90"
default['vlg-opt']['nrpe']['check_cpu']['warning'] = "70"
default['vlg-opt']['nrpe']['check_cpu']['critical'] = "80"
