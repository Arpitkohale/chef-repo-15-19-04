# haproxy
default['vlg-lz-ps']['haproxy']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-ps']['haproxy']['group'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-ps']['haproxy']['nbproc'] = "1"
default['vlg-lz-ps']['haproxy']['etc_dir'] = "/etc/haproxy"
default['vlg-lz-ps']['package_file'] = "haproxy-1.5.14-1.amzn1.x86_64.rpm"
default['vlg-lz-ps']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/haproxy-1.5.14-1.amzn1.x86_64.rpm"


case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-ps']['se_backend'] = [ 'usorlzseprd03.inf.videologygroup.com', 'usorlzseprd04.inf.videologygroup.com' ]
      default['vlg-lz-ps']['listen']['443']['pem'] = '/etc/pki/tls/private/star.videologygroup.com.pem'
    when "usva"
      default['vlg-lz-ps']['se_backend'] = 'localhost'
    when "euir"
      default['vlg-lz-ps']['se_backend'] = 'localhost'
    when "apsg"
      default['vlg-lz-ps']['se_backend'] = 'localhost'
    end
  when "sandbox"
    default['vlg-lz-ps']['se_backend'] = [ 'usvalzsesbx01.inf.videologygroup.com' ]
    default['vlg-lz-ps']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  when "staging"
    default['vlg-lz-ps']['se_backend'] = [ 'usvalzsestg01.inf.videologygroup.com' ]
    default['vlg-lz-ps']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  when "endtoend"
    default['vlg-lz-ps']['se_backend'] = [ 'usvalzseete01.inf.videologygroup.com', 'usvalzseete02.inf.videologygroup.com' ]
    default['vlg-lz-ps']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  else
     default['vlg-lz-ps']['se_backend'] = 'localhost'
end

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
