# haproxy

case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-px-di']['di_backend'] = nil
    when "usva"
      default['vlg-lz-px-di']['di_backend'] = [ 'usvalzdiprd01.inf.videologygroup.com', 'usvalzdiprd02.inf.videologygroup.com', 'usvalzdiprd03.inf.videologygroup.com', 'usvalzdiprd04.inf.videologygroup.com' ]
    when "euir"
      default['vlg-lz-px-di']['di_backend'] = nil
    when "apsg"
      default['vlg-lz-px-di']['di_backend'] = nil
    end
  when "sandbox"
     default['vlg-lz-px-di']['di_backend'] = [ 'usvalzdisbx01.inf.videologygroup.com' ]
  when "staging"
     default['vlg-lz-px-di']['di_backend'] = [ 'usvalzdistg01.inf.videologygroup.com' ]
  else
     default['vlg-lz-px-di']['di_backend'] = [ 'localhost' ]
  end

# sudo
case node.chef_environment
  when "production"
    default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
end
