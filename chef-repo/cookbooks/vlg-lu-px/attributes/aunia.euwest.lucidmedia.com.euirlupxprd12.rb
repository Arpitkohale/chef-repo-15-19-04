# node: euirlupxprd12
# endpoint: aunia.euwest.lucidmedia.com
if node['hostname'] == 'euirlupxprd12'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
