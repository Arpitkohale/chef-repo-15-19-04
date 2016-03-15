# node: usvalupxprd13
# endpoint: pubmatic.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd13'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '10'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
