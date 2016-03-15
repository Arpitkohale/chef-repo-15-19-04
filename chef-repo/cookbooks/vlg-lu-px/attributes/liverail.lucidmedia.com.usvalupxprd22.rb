# node: usvalupxprd22
# endpoint: liverail.lucidmedia.com
if node['hostname'] == 'usvalupxprd22'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '3000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
