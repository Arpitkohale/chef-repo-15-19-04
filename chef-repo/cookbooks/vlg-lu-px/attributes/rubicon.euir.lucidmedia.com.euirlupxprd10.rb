# node: euirlupxprd10
# endpoint: rubicon.euir.lucidmedia.com
if node['hostname'] == 'euirlupxprd10'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
