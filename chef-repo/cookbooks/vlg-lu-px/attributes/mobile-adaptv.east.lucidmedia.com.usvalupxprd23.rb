# node: usvalupxprd23
# endpoint: mobile-adaptv.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd23'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
