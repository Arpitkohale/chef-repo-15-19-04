#
# Cookbook Name:: vlg-base
# Recipe:: sudoers
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# We want to give the app_user passwordless sudo for various commands. This is useful for things like automated deployments.
# -jp
sudo node['vlg-base']['app_user'] do
  user      node['vlg-base']['app_user']
  nopasswd  true
  commands  node['vlg-base']['sudoers']['app_user']
end
