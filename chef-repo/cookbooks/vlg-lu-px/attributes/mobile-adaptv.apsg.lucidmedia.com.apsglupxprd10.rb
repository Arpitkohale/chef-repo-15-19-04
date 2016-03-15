# node: apsglupxprd10
# endpoint: mobile-adaptv.apsg.lucidmedia.com
if node['hostname'] == 'apsglupxprd10'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '300'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
