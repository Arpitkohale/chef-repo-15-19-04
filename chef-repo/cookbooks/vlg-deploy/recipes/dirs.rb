#
# Cookbook Name:: vlg-deploy
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory node['vlg-deploy']['ansible_config_dir'] do
    owner node['vlg-deploy']['user']
    group node['vlg-deploy']['group']
    mode "0755"
    action :create
end
