#
# Cookbook Name:: vlg-lu-db
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-lu-db']['backup_dir'],
  node['vlg-base']['log_dir'] + "/lu-db-backup",
  node['vlg-base']['log_dir'] + "/lu-db-schema-reset"
]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
  end
end
