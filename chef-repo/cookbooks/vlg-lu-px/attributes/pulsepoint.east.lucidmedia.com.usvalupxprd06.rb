# node: usvalupxprd06
# endpoint: pulsepoint.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd06'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
end
