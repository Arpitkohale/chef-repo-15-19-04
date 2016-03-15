# node: usvalupxprd15
# endpoint: adaptv.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd15'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '6000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
