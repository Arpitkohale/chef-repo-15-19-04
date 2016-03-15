# haproxy
default['vlg-lz-pc']['haproxy']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-pc']['haproxy']['group'] = "#{node['vlg-base']['app_user']}"
default['vlg-lz-pc']['haproxy']['nbproc'] = "1"
default['vlg-lz-pc']['haproxy']['etc_dir'] = "/etc/haproxy"
default['vlg-lz-pc']['package_file'] = "haproxy-1.5.14-1.amzn1.x86_64.rpm"
default['vlg-lz-pc']['package_full_url'] = "http://s3.amazonaws.com/videologypublic/repo/haproxy-1.5.14-1.amzn1.x86_64.rpm"


case node.chef_environment
  when "production"
    case node['vlg-base']['location']
    when "usor"
      default['vlg-lz-pc']['cm_backend'] = [ 'usorlzcmprd03.inf.videologygroup.com', 'usorlzcmprd04.inf.videologygroup.com' ]
      default['vlg-lz-pc']['listen']['443']['pem'] = '/etc/pki/tls/private/star.videologygroup.com.pem'
    when "usva"
      default['vlg-lz-pc']['cm_backend'] = 'localhost'
    when "euir"
      default['vlg-lz-pc']['cm_backend'] = 'localhost'
    when "apsg"
      default['vlg-lz-pc']['cm_backend'] = 'localhost'
    end
  when "sandbox"
    default['vlg-lz-pc']['cm_backend'] = [ 'usvalzcmsbx01.inf.videologygroup.com' ]
    default['vlg-lz-pc']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  when "staging"
    default['vlg-lz-pc']['cm_backend'] = [ 'usvalzcmstg01.inf.videologygroup.com' ]
    default['vlg-lz-pc']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  when "endtoend"
    default['vlg-lz-pc']['cm_backend'] = [ 'usvalzcmete01.inf.videologygroup.com', 'usvalzcmete02.inf.videologygroup.com' ]
    default['vlg-lz-pc']['listen']['443']['pem'] = '/etc/pki/tls/private/star.qa.videologygroup.com.pem'
  else
     default['vlg-lz-pc']['cm_backend'] = 'localhost'
end

#sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
