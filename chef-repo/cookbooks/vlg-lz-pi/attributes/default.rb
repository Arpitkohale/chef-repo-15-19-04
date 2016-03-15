# haproxy

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-pi']['di_backend'] = [ 'usorlzdiprd03.inf.videologygroup.com', 'usorlzdiprd04.inf.videologygroup.com' ]
    when "usva"
      default['vlg-lz-pi']['di_backend'] = [ 'usvalzdiprd01.inf.videologygroup.com', 'usvalzdiprd02.inf.videologygroup.com' ]
    when "euir"
      default['vlg-lz-pi']['di_backend'] = [ 'euirlzdiprd03.inf.videologygroup.com', 'euirlzdiprd04.inf.videologygroup.com' ]
    when "apsg"
      default['vlg-lz-pi']['di_backend'] = [ 'apsglzdiprd03.inf.videologygroup.com', 'apsglzdiprd04.inf.videologygroup.com' ]
    end
  when "sandbox"
     default['vlg-lz-pi']['di_backend'] = 'localhost'
  when "staging"
     default['vlg-lz-pi']['di_backend'] = [ 'usvalzdistg01.inf.videologygroup.com', 'usvalzdistg02.inf.videologygroup.com' ]
  else
     default['vlg-lz-pi']['di_backend'] = 'localhost'
end

# ssl
default['vlg-lz-pi']['listen']['443']['pem'] = '/etc/pki/tls/private/star.tidaltv.com.pem'

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
