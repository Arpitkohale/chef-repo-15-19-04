# haproxy
default['vlg-lz-pe']['haproxy']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-pe']['haproxy']['group'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-pe']['haproxy']['nbproc'] = "4"
default['vlg-lz-pe']['package_file'] = "haproxy-1.5.14-1.amzn1.x86_64.rpm"
default['vlg-lz-pe']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/haproxy-1.5.14-1.amzn1.x86_64.rpm"

usorlzdaprd_da_backend = [
    'usorlzdaprd20.inf.videologygroup.com',
    'usorlzdaprd21.inf.videologygroup.com',
    'usorlzdaprd22.inf.videologygroup.com',
    'usorlzdaprd23.inf.videologygroup.com',
    'usorlzdaprd24.inf.videologygroup.com',
    'usorlzdaprd25.inf.videologygroup.com',
    'usorlzdaprd26.inf.videologygroup.com'
]

usvalzdaprd_da_backend = [
    'usvalzdaprd01.inf.videologygroup.com',
    'usvalzdaprd02.inf.videologygroup.com',
    'usvalzdaprd03.inf.videologygroup.com',
    'usvalzdaprd04.inf.videologygroup.com',
    'usvalzdaprd05.inf.videologygroup.com',
    'usvalzdaprd06.inf.videologygroup.com',
    'usvalzdaprd07.inf.videologygroup.com',
    'usvalzdaprd08.inf.videologygroup.com'
]

euirlzdaprd_da_backend = [
    'euirlzdaprd01.inf.videologygroup.com',
    'euirlzdaprd02.inf.videologygroup.com'
]

apsglzdaprd_da_backend = [
    'apsglzdaprd01.inf.videologygroup.com',
    'apsglzdaprd02.inf.videologygroup.com'
]

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-pe']['da_backend'] = usorlzdaprd_da_backend
    when "usva"
      default['vlg-lz-pe']['da_backend'] = usvalzdaprd_da_backend
    when "euir"
      default['vlg-lz-pe']['da_backend'] = euirlzdaprd_da_backend
    when "apsg"
      default['vlg-lz-pe']['da_backend'] = apsglzdaprd_da_backend
    end
  when "sandbox"
     default['vlg-lz-pe']['da_backend'] = 'localhost'
  when "staging"
     default['vlg-lz-pe']['da_backend'] = [ 'usvalzdastg02.inf.videologygroup.com', 'usvalzdastg03.inf.videologygroup.com' ]
  else
     default['vlg-lz-pe']['da_backend'] = 'localhost'
end

# ssl
if node['hostname'] == 'usorlzpeprd03' || node['hostname'] == 'usorlzpeprd04'
  default['vlg-lz-pe']['listen']['443']['pem'] = '/etc/pki/tls/private/star.cmrdr.com.pem'
else
  default['vlg-lz-pe']['listen']['443']['pem'] = '/etc/pki/tls/private/star.tidaltv.com.pem'
end

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
