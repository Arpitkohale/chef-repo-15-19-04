# node: euirlupxprd15
# endpoint: pubmatic.euir.lucidmedia.com
if node['hostname'] == 'euirlupxprd15'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '600'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
