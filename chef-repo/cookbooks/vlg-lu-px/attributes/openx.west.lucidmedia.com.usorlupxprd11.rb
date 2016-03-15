# node: usorlupxprd11
# endpoint: openx.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd11'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
