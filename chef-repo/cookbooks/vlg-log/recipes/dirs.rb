#
# Cookbook Name:: vlg-log
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directories = [ "#{node['vlg-log']['s3_mount_path']}",
                "#{node['vlg-log']['s3_tmp_path']}"
]

directories.each do |directory_name|
  directory directory_name do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end
