# node: usvalupxete01
# endpoint: usvalupxete.inf.videologygroup.com
if node['hostname'] == 'usvalupxete01'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.lucidmedia.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['8080']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['8080']['maxconn'] = '1000'
  default['vlg-lu-px']['haproxy']['listen']['9030']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['9030']['maxconn'] = '1000'
end
