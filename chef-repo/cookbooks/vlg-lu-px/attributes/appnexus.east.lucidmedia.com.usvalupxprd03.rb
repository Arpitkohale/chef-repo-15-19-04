# node: usvalupxprd03
# endpoint: appnexus.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd03'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '200'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
