# node: apsglupxprd01
# endpoint: google-apse.tidaltv.com
if node['hostname'] == 'apsglupxprd01'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.tidaltv.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-keep-alive'] = '10s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-request'] = '6s'
end
