# node: usorlupxprd14
# endpoint: pulsepoint.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd14'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
end
