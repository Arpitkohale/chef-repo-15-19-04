# node: usorlupxprd18
# endpoint: spotx-mob.west.lucidmedia.com & spotx-mob.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd18'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
