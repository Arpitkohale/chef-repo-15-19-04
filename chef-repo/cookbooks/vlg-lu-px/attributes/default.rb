# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# packages
default['packages'] = node['packages'] + [ 'socat' ]

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
end

# haproxy
default['vlg-lu-px']['haproxy']['global']['user'] = node['vlg-base']['app_user']
default['vlg-lu-px']['haproxy']['global']['group'] = node['vlg-base']['app_user']
default['vlg-lu-px']['haproxy']['global']['maxconn'] = '16384'
default['vlg-lu-px']['haproxy']['global']['nbproc'] = '1'
default['vlg-lu-px']['haproxy']['global']['stats']['socket']['file'] = '/var/run/haproxy.sock'
default['vlg-lu-px']['haproxy']['global']['stats']['socket']['timeout'] = '2m'
default['vlg-lu-px']['haproxy']['global']['tune']['ssl']['default-dh-param'] = '2048'

# ssl
# default to the 'intermediate' security profile according to https://mozilla.github.io/server-side-tls/ssl-config-generator/
default['vlg-lu-px']['haproxy']['global']['ssl']['default-bind-ciphers'] = 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA'
default['vlg-lu-px']['haproxy']['global']['ssl']['default-bind-options'] = 'ssl no-sslv3 crt'

default['vlg-lu-px']['haproxy']['defaults']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['defaults']['retries'] = '3'
default['vlg-lu-px']['haproxy']['defaults']['default-server'] = 'inter 3s rise 3 fall 3'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['client'] = '3s'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['connect'] = '3s'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-keep-alive'] = '5s'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-request'] = '3s'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['queue'] = '3s'
default['vlg-lu-px']['haproxy']['defaults']['timeout']['server'] = '3s'
default['vlg-lu-px']['haproxy']['defaults']['balance'] = 'roundrobin'

default['vlg-lu-px']['haproxy']['listen']['8161']['toggle'] = 'enable'
default['vlg-lu-px']['haproxy']['listen']['8161']['maxconn'] = '10'
default['vlg-lu-px']['haproxy']['listen']['8161']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['listen']['8161']['send-traffic-to-staging'] = 'false'

default['vlg-lu-px']['haproxy']['listen']['8162']['stats']['uri'] = '/lbstats'

default['vlg-lu-px']['haproxy']['backend']['weight'] = '256'
default['vlg-lu-px']['haproxy']['staging']['backend']['weight'] = '1'

default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'disable'
default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '0'
default['vlg-lu-px']['haproxy']['listen']['80']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'false'

default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'disable'
default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '0'
default['vlg-lu-px']['haproxy']['listen']['443']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['listen']['443']['send-traffic-to-staging'] = 'false'
default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = ''

default['vlg-lu-px']['haproxy']['listen']['8080']['toggle'] = 'disable'
default['vlg-lu-px']['haproxy']['listen']['8080']['maxconn'] = '0'
default['vlg-lu-px']['haproxy']['listen']['8080']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['listen']['8080']['send-traffic-to-staging'] = 'false'

default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'disable'
default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '0'
default['vlg-lu-px']['haproxy']['listen']['9030']['mode'] = 'http'
default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'false'

# cron
unless Chef::Config[:solo]
default['vlg-cron']['jobs']['lu-px-generate-star-lucidmedia-com-ocsp'] = {
  'time' => '0 * * * *',
  'user' => "root",
  'command' => "#{node['vlg-base']['bin_dir']}/generate-star-lucidmedia-com-ocsp.sh > /dev/null 2>&1",
}
default['vlg-cron']['jobs']['lu-px-generate-star-tidaltv-com-ocsp'] = {
  'time' => '5 * * * *',
  'user' => "root",
  'command' => "#{node['vlg-base']['bin_dir']}/generate-star-tidaltv-com-ocsp.sh > /dev/null 2>&1",
}
end
