#
# Cookbook Name:: vlg-dotfiles
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Before adding yourself to this list you must create a files/default/<username> directory
users = [ 'jpollara' ]
users.each do |user|
  remote_directory "/home/#{user}" do
    files_owner "#{user}"
    files_group "#{user}"
    owner "#{user}"
    group "#{user}"
    source "#{user}"
    only_if "test -d /home/#{user}"
    ignore_failure true
  end
end
