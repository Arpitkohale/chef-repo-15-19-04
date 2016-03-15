#
# Cookbook Name:: vlg-syslog-server
# Recipe:: mounts
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

execute "mkfs.ext4 /dev/xvdj" do
  command "mkfs.ext4 /dev/xvdj"
  not_if  "grep -w /dev/xvdj /proc/mounts /etc/fstab"
end

mount node['vlg-syslog-server']['data_mount'] do
  device "/dev/xvdj"
  fstype "ext4"
  action [:mount, :enable]
end
