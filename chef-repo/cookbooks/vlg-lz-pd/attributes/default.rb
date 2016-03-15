# haproxy

usor_lz_pd_da_backend = [
    'usorlzdaprd05.inf.videologygroup.com',
    'usorlzdaprd06.inf.videologygroup.com',
    'usorlzdaprd07.inf.videologygroup.com',
    'usorlzdaprd08.inf.videologygroup.com',
    'usorlzdaprd27.inf.videologygroup.com',
    'usorlzdaprd28.inf.videologygroup.com',
    'usorlzdaprd29.inf.videologygroup.com',
    'usorlzdaprd30.inf.videologygroup.com' 
]

usva_lz_pd_da_backend =  [
    'usvalzdaprd09.inf.videologygroup.com',
    'usvalzdaprd10.inf.videologygroup.com',
    'usvalzdaprd11.inf.videologygroup.com',
    'usvalzdaprd12.inf.videologygroup.com',
    'usvalzdaprd13.inf.videologygroup.com',
    'usvalzdaprd14.inf.videologygroup.com',
    'usvalzdaprd15.inf.videologygroup.com',
    'usvalzdaprd16.inf.videologygroup.com'
]

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-pd']['da_backend'] = usor_lz_pd_da_backend
    when "usva"
      default['vlg-lz-pd']['da_backend'] = usva_lz_pd_da_backend
    when "euir"
      default['vlg-lz-pd']['da_backend'] = [ 'euirlzdaprd03.inf.videologygroup.com', 'euirlzdaprd04.inf.videologygroup.com' ]
    when "apsg"
      default['vlg-lz-pd']['da_backend'] = [ 'apsglzdaprd03.inf.videologygroup.com', 'apsglzdaprd04.inf.videologygroup.com' ]
    end
  when "sandbox"
     default['vlg-lz-pd']['da_backend'] = [ 'localhost' ]
  when "staging"
     default['vlg-lz-pd']['da_backend'] = [ 'localhost' ]
  else
     default['vlg-lz-pd']['da_backend'] = [ 'localhost' ]
end

default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
