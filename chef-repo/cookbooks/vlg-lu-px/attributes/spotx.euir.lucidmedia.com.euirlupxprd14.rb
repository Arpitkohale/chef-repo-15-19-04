# node: euirlupxprd14
# endpoint: spotx.euir.lucidmedia.com
if node['hostname'] == 'euirlupxprd14'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '200'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
