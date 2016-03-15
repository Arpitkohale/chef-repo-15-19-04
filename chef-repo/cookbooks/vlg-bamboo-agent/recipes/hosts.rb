#
# Cookbook Name:: vlg-bamboo-agent
# Recipe:: hosts
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

bash 'setup_etc_hosts' do
  code <<-EOH
    echo "127.0.1.1 #{node.name}.inf.videologygroup.com #{node.name}" >> /etc/hosts
    EOH
    not_if "grep -q #{node.name} /etc/hosts"
end
