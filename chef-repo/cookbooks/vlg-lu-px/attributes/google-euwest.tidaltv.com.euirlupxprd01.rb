# node: euirlupxprd01
# endpoint: google-euwest.tidaltv.com
if node['hostname'] == 'euirlupxprd01'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '4000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '4000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-keep-alive'] = '10s'
  default['vlg-lu-px']['haproxy']['defaults']['timeout']['http-request'] = '6s'
end
