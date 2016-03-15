# node: euirlupxprd09
# endpoint: appnexus.euwest.lucidmedia.com
if node['hostname'] == 'euirlupxprd09'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '50'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
