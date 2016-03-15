default['vlg-ephemeral']['configuration'] = 'striped'
default['vlg-ephemeral']['striped']['root'] = "/mnt"
default['ephemeral_lvm']['mount_point'] = "#{node['vlg-ephemeral']['striped']['root']}"
default['vlg-ephemeral']['jbod']['root'] = "/media"
