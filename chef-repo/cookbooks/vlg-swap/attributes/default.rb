default['vlg-swap']['path'] = "#{node['vlg-ephemeral']['striped']['root']}/swap"
default['vlg-swap']['persist'] = true

case node.chef_environment
when "production"
  default['vlg-swap']['size'] = 1024
when "sandbox"
  default['vlg-swap']['size'] = 1024
else
  default['vlg-swap']['size'] = 32
end

default['vlg-swap']['enable'] = true
