#
# Cookbook Name:: vlg-base
# Recipe:: app_user
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create the app user group
users_manage node['vlg-base']['app_user'] do
  group_id 501
  action [ :remove, :create ]
end

# create the app user in vagrant (set the uid to 501 because the vagrant user steals 500)
if Chef::Config[:solo]
  user node['vlg-base']['app_user'] do
    supports :manage_home => true
    comment node['vlg-base']['app_user']
    uid 501
    gid 501
    home "/mnt/#{node['vlg-base']['app_user']}"
    shell '/bin/bash'
  end
end

# create the app user in all other environments
# not if the app user already exists
unless Chef::Config[:solo]
  user node['vlg-base']['app_user'] do
    supports :manage_home => true
    comment node['vlg-base']['app_user']
    uid 500
    gid 501
    home "/mnt/#{node['vlg-base']['app_user']}"
    shell '/bin/bash'
    not_if "id #{node['vlg-base']['app_user']}"
  end
end

# create the /home/appuser symlink
# not if /home/<app_user> already exists
link "#{node['vlg-base']['app_user_home']}" do
  to "/mnt/#{node['vlg-base']['app_user']}"
  not_if "test -e /home/#{node['vlg-base']['app_user']}"
end

# make sure the app user home dir has the correct permissions
directory node['vlg-base']['app_user_home'] do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode '0755'
  action :create
end

directory "/mnt/#{node['vlg-base']['app_user']}" do
  owner node['vlg-base']['app_user']
  group node['vlg-base']['app_user']
  mode '0755'
  action :create
  only_if "id #{node['vlg-base']['app_user']}"
end

# Create the vlg ssh directory and dist the authorized keys file
# I made this very specific to the vlg user because we want to make sure this authorized_keys file is only used for the vlg user
# -jp
directory "/home/vlg/.ssh" do
  owner "vlg"
  group "vlg"
  mode "0700"
  action :create
  only_if "test -e /home/vlg"
end

template '/home/vlg/.ssh/authorized_keys' do
  source 'vlg-ssh-authorized_keys.erb'
  owner 'vlg'
  group 'vlg'
  mode '0600'
  only_if 'test -d /home/vlg/.ssh'
end
