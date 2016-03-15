# node: usorlupxprd13
# endpoint: adaptv.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd13'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '6000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
