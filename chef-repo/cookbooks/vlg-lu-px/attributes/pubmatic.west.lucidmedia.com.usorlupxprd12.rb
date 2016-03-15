# node: usorlupxprd12
# endpoint: pubmatic.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd12'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '20'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
