#
# Cookbook Name:: vlg-data-normalizer
# Recipe:: providers
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

users = data_bag('data-providers')

users_manage "sftpusers" do
  data_bag "data-providers"
  group_id 66000
  action [ :remove, :create ]
end

users.each do |id|
  group node['vlg-base']['app_user'] do
    action :modify
    members "#{id}"
    append true
  end
  directory "#{node['vlg-data-normalizer']['provider_root']}/#{id}" do
    owner 'root'
    group node['vlg-base']['app_user']
    recursive true
    action :create
    mode '0750'
    only_if "test -d #{node['vlg-data-normalizer']['provider_root']}"
  end
  # chef doesn't have support for setfacl so we have to create the ftproot and set the acl manually. not ideal.
  # we need to do this so the vlg user can move files in the data providers ftproot
  # -jp
  bash 'provider_ftproot' do
    code <<-EOH
      if [ ! -d "#{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot" ]
      then
        mkdir #{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot
      fi
      chown "#{id}:#{node['vlg-base']['app_user']}" #{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot
      chmod 0770 #{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot
      setfacl -d -m g::rwx #{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot
      setfacl -d -m o::rx #{node['vlg-data-normalizer']['provider_root']}/#{id}/ftproot
      EOH
    only_if "test -d #{node['vlg-data-normalizer']['provider_root']}/#{id}"
  end
end
