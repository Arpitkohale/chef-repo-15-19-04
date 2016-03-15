# node: apsglupxprd06
# endpoint: brx.apse.lucidmedia.com
if node['hostname'] == 'apsglupxprd06'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
end
