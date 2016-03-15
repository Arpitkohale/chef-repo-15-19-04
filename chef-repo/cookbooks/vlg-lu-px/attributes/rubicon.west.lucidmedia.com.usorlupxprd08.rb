# node: usorlupxprd08
# endpoint: rubicon.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd08'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2800'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
