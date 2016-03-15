# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# java
default['java']['jdk']['8']['x86_64']['url'] = "http://s3.amazonaws.com/videologypublic/repo/jdk-8u11-linux-x64.tar.gz"
default['java']['jdk']['8']['x86_64']['checksum'] = "13ee1d0bf6baaf2b119115356f234a48"

# activemq
case node.chef_environment
when "production"
  default["vlg-activemq"]["jvm_heap"] = "5g"
  default['vlg-activemq']['network_connectors'] = 'true'
  case node['vlg-base']['location']
  when "usva"
    default['vlg-activemq']['master'] = 'true'
  else
    default['vlg-activemq']['slave'] = 'true'
  end
when "endtoend"
  default["vlg-activemq"]["jvm_heap"] = "5g"
  default['vlg-activemq']['network_connectors'] = 'false'
when "staging"
  default["vlg-activemq"]["jvm_heap"] = "5g"
  default['vlg-activemq']['network_connectors'] = 'false'
when "sandbox"
  default["vlg-activemq"]["jvm_heap"] = "1g"
  default['vlg-activemq']['network_connectors'] = 'false'
else
  default['vlg-activemq']['jvm_heap'] = '128m'
  default['vlg-activemq']['network_connectors'] = 'false'
end

# swap
case node.chef_environment
when "production"
  force_override['vlg-swap']['size'] = 32768
when "endtoend"
  force_override['vlg-swap']['size'] = 32768
when "staging"
  force_override['vlg-swap']['size'] = 32768
when "sandbox"
  force_override['vlg-swap']['size'] = 32768
end

# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'lucy' ]
end

# swap
case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 32768
when "endtoend"
  default['vlg-swap']['size'] = 32768
when "staging"
  default['vlg-swap']['size'] = 32768
when "sandbox"
  default['vlg-swap']['size'] = 32768
end
