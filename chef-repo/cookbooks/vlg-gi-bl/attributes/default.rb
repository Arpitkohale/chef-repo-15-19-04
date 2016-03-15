# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# datadog
default['datadog']['tags'] = 'MIS'

# videology

#swap
case node.chef_environment
when "production"
  force_override['vlg-swap']['size'] = 8191
when "sandbox"
  force_override['vlg-swap']['size'] = 5120
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'mis' ]
end
