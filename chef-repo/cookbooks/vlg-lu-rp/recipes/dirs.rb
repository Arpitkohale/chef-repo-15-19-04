#
# Cookbook Name:: vlg-lu-rp
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#

# Create directories and proper permissions and ownerships
directories1 = [
  "/reportingdir", "/store", "/store1", "/store2", "/store3", "/store4"
]

directories2 = [
  "/build_info", "/specifications", "/extensions", "/gems"
]

directories3 = [
  "/backup", "/archive"
] 
  
directories1.each do |dir_name|
  directory dir_name do
    mode "0755"
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    action :create
  end	
end

directories2.each do |dir_name|
  directory dir_name do
    mode "0775"
    owner "root"
    group "root"
    action :create
  end	
end

directories3.each do |dir_name|
  directory dir_name do
    mode "0755"
    owner "root"
    group "root"
    action :create
  end	
end





