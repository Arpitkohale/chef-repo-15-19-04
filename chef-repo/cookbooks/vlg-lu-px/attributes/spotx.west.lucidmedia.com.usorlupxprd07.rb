# node: usorlupxprd07
# endpoint: spotx.west.lucidmedia.com & spotx-mob.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd07'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2500'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
