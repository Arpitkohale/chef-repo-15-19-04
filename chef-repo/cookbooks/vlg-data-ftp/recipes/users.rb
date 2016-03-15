#
# Cookbook Name:: vlg-data-ftp
# Recipe:: users
#
# Copyright 2015, Videology Group, Inc
#
# All rights reserved - Do Not Redistribute
#

users_manage "ftpusers" do
  data_bag "data-ftp-users"
  group_id 86000
  action [ :remove, :create ]
end

users = data_bag('data-ftp-users')

users.each do |id|
  group node['vlg-base']['app_user'] do
    action :modify
    members "#{id}"
    append true
  end
  directory "#{node['vlg-data-ftp']['ftp_root']}/#{id}" do
    owner 'root'
    group node['vlg-base']['app_user']
    recursive true
    action :create
    mode '0750'
    only_if "test -d #{node['vlg-data-ftp']['ftp_root']}"
  end
  # chef doesn't have support for setfacl so we have to create the ftproot and set the acl manually. not ideal.
  # we need to do this so the vlg user can move files in the ftp users ftproot
  # -jp
  bash 'ftproot' do
    code <<-EOH
      if [ ! -d "#{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot" ]
      then
        mkdir #{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot
      fi
      chown "#{id}:#{node['vlg-base']['app_user']}" #{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot
      chmod 2770 #{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot
      setfacl -d -m g::rwx #{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot
      setfacl -d -m o::rx #{node['vlg-data-ftp']['ftp_root']}/#{id}/ftproot
      EOH
    only_if "test -d #{node['vlg-data-ftp']['ftp_root']}/#{id}"
  end
end
