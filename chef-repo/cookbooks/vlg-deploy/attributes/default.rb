# pip packages
default['vlg-deploy']['python_pip_packages'] = [ 'paramiko', 'PyYAML', 'Jinja2', 'httplib2', 'boto', 'pywinrm' ]

# ansible playbooks
default['vlg-deploy']['ansible_playbooks_dir'] = "#{node['vlg-base']['app_user_home']}/ansible-playbooks"

# ansible config
default['vlg-deploy']['ansible_config_dir'] = "/etc/ansible"

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza', 'lucy', 'optdev' ]
default['vlg-base']['sudoers']['app_user'] = node['vlg-base']['sudoers']['app_user'] + [ '/usr/bin/knife *' ]
