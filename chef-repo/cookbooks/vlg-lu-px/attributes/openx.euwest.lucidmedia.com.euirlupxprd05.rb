# node: euirlupxprd05
# endpoint: openx.euwest.lucidmedia.com
if node['hostname'] == 'euirlupxprd05'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
