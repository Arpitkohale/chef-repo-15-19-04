#
# Cookbook Name:: vlg-tomcat
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# create dirs and set proper permissions
directories = [
  node['vlg-tomcat']['catalina_base'],
  node['vlg-tomcat']['conf_dir'],
  node['vlg-tomcat']['logs_dir'],
  node['vlg-tomcat']['temp_dir'],
  node['vlg-tomcat']['webapps_dir'],
  node['vlg-tomcat']['work_dir'],
  node['vlg-tomcat']['bin_dir']
]

directories.each do |dir_name|
  directory dir_name do
    owner node['vlg-tomcat']['user']
    group node['vlg-tomcat']['group']
    mode "0755"
    recursive true
  end
end
