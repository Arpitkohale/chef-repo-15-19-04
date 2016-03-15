# node: euirlupxprd06
# endpoint: google.euwest.lucidmedia.com
if node['hostname'] == 'euirlupxprd06'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
