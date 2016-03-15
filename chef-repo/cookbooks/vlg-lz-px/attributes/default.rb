# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# haproxy
case node.chef_environment
when "production"
  default['vlg-lz-px']['fc_backend'] = nil
  default['vlg-lz-px']['ce_backend'] = nil
when "sandbox"
  default['vlg-lz-px']['fc_backend'] = nil
  default['vlg-lz-px']['ce_backend'] = nil
else
  default['vlg-lz-px']['fc_backend'] = [ 'localhost' ]
  default['vlg-lz-px']['ce_backend'] = [ 'localhost' ]
end
