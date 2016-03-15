# node: usorlupxprd02
# endpoint: brx.west.lucidmedia.com
if node['hostname'] == 'usorlupxprd02'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '10000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.lucidmedia.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '10000'
end
