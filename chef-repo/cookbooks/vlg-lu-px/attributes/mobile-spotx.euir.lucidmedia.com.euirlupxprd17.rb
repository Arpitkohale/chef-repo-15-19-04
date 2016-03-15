# node: euirlupxprd17
# endpoint: mobile-spotx.euir.lucidmedia.com
if node['hostname'] == 'euirlupxprd17'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
