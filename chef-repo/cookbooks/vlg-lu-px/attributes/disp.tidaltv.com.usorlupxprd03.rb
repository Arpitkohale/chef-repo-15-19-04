# node: usorlupxprd03
# endpoint: disp.tidaltv.com
if node['hostname'] == 'usorlupxprd03'
  default['vlg-lu-px']['haproxy']['listen']['80']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['80']['maxconn'] = '10000'
  default['vlg-lu-px']['haproxy']['listen']['443']['toggle'] = 'enable'
  default['vlg-lu-px']['haproxy']['listen']['443']['pem'] = '/etc/pki/tls/private/star.tidaltv.com.pem'
  default['vlg-lu-px']['haproxy']['listen']['443']['maxconn'] = '10000'
end
