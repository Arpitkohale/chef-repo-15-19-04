# node: apsglupxprd08
# endpoint: spotx.apsg.lucidmedia.com
if node['hostname'] == 'apsglupxprd08'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '2000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.lucidmedia.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '2000'
end
