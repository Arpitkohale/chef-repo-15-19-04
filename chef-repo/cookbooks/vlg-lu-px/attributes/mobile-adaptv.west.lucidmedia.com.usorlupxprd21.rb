# node: usorlupxprd21
# endpoint: mobile-adaptv.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd21'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
