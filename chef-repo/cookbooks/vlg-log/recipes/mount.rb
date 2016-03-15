#
# Cookbook Name:: vlg-log
# Recipe:: mount
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

mounts = node['vlg-log']['s3_buckets']
mounts.each do |mount|
  directory "#{node['vlg-log']['s3_mount_path']}/#{mount}" do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    not_if "test -d #{node['vlg-log']['s3_mount_path']}/#{mount}"
  end
  mount "#{node['vlg-log']['s3_mount_path']}/#{mount}" do
    device "s3fs##{mount}"
    fstype "fuse"
    options "ro,noatime,use_rrs,allow_other,uid=500,gid=100,umask=0113,use_cache=#{node['vlg-log']['s3_tmp_path']}"
    pass 0
    action [:mount, :enable]
    not_if "grep -w #{node['vlg-log']['s3_mount_path']}/#{mount} /proc/mounts"
  end
end
