# node: usvalupxprd25
# endpoint: mobile-brx.east.lucidmedia.com
if node['hostname'] == 'usvalupxprd25'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '3000'
  default['vlg-lu-px']['haproxy']['listen']['80']['send-traffic-to-staging'] = 'true'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.lucidmedia.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '3000'
end
