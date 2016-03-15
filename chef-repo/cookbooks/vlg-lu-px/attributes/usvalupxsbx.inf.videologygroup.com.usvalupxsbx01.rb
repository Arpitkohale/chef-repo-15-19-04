# node: usvalupxsbx01
# endpoint: usvalupxsbx.inf.videologygroup.com
if node['hostname'] == 'usvalupxsbx01'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['client'] = '30s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['connect'] = '30s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-keep-alive'] = '30s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-request'] = '30s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['queue'] = '30s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['server'] = '30s'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.lucidmedia.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['8080']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['8080']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1000'
end
