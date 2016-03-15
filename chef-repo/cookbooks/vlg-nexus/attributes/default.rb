# user/group
default['vlg-nexus']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-nexus']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-nexus']['version'] = '2.11.3-01'
default['vlg-nexus']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/nexus-2.11.3-01-bundle.tar.gz'
default['vlg-nexus']['install_dir'] = '/usr/local'
default['vlg-nexus']['link_dir_path'] = "/usr/local/Nexus/nexus-2.11.3-01"

#nexus
default['vlg-nexus']['base_dir'] = "/usr/local/Nexus"
default['vlg-nexus']['home'] = "#{node['vlg-base']['app_user_home']}"
default['vlg-nexus']['vhost'] = 'nexus.videologygroup.com' 
default['vlg-nexus']['pid_dir'] = "#{node['vlg-nexus']['home']}/nexus"

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "f3593b248b64cc53bf191f45b92a1f10e8c5099c2f84bd5bd5d6465dfd07a8e9"
default['packages'] = node['packages'] + [ 'httpd' ]
default['vlg-nexus']['httpd_conf']="/etc/httpd/conf.d"
