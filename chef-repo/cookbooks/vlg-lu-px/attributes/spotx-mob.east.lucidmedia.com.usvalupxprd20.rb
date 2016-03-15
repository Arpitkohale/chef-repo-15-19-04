# node: usvalupxprd20
# endpoint: spotx-mob.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd20'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
