# node: usvalupxprd04
# endpoint: spotx.east.lucidmedia.com & spotx-mob.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd04'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
