# sudo
case node.chef_environment
when "production"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'optdev', 'rnd' ]
when "staging"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'optdev', 'rnd' ]
when "endtoend"
  default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'optdev', 'rnd' ]
end

# aws_datacenter
case node.chef_environment
when "production"
  default['vlg-tomcat']['aws_datacenter'] = "opt.production"
when "staging"
  default['vlg-tomcat']['aws_datacenter'] = "opt.staging"
when "sandbox"
  default['vlg-tomcat']['aws_datacenter'] = "opt.sandbox"
when "endtoend"
  default['vlg-tomcat']['aws_datacenter'] = "opt.endtoend"
else
  default['vlg-tomcat']['aws_datacenter'] = "opt"
end
