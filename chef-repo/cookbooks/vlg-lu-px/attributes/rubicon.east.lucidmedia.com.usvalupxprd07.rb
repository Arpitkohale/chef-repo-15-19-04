# node: usvalupxprd07
# endpoint: rubicon.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd07'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '750'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
