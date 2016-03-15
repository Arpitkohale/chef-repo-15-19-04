#
# Cookbook Name:: vlg-lz-up
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

ephemeral_jbod_root = node['vlg-ephemeral']['jbod']['root']

# We have to use bash because Chef doesn't pick up on the ephemeral mounts during bootstrap
if !File.exist?("/archive")
  bash "archive dir" do
    code <<-EOH
    if [ -d "#{ephemeral_jbod_root}/ephemeral1" ]
    then
      mkdir -p "#{ephemeral_jbod_root}/ephemeral1/archive"
      chown #{node['vlg-base']['app_user']}:#{node['vlg-base']['app_user']} #{ephemeral_jbod_root}/ephemeral1/archive
      ln -s #{ephemeral_jbod_root}/ephemeral1/archive /archive
    else
      mkdir -p /archive
      chown #{node['vlg-base']['app_user']}:#{node['vlg-base']['app_user']} /archive
    fi
    EOH
  end
end

if File.exist?("/archive")
  directories = [
                 "/archive/logs"
                ]
  directories.each do |dir_name|
    directory dir_name do
      owner "#{node['vlg-base']['app_user']}"
      group "#{node['vlg-base']['app_user']}"
      mode "0755"
    end
  end
end

if !File.exist?("/store")
  bash "store dir" do
    code <<-EOH
    if [ -d "#{ephemeral_jbod_root}/ephemeral2" ]
    then
      mkdir -p "#{ephemeral_jbod_root}/ephemeral2/store"
      chown #{node['vlg-base']['app_user']}:#{node['vlg-base']['app_user']} #{ephemeral_jbod_root}/ephemeral2/store
      ln -s #{ephemeral_jbod_root}/ephemeral2/store /store
    else
      mkdir -p /store
      chown #{node['vlg-base']['app_user']}:#{node['vlg-base']['app_user']} /store
    fi
    EOH
  end
end

if File.exist?("/store")
  directories = [
                 "/store/logs",
                 "/store/logs/clicksense",
                 "/store/logs/tomcat"
                ]
  directories.each do |dir_name|
    directory dir_name do
      owner "#{node['vlg-base']['app_user']}"
      group "#{node['vlg-base']['app_user']}"
      mode "0755"
    end
  end
end

# clicksense local dirs
directories = [
               "#{node["vlg-clicksense"]["local_dir"]}/conf",
               "#{node["vlg-clicksense"]["local_dir"]}/cache",
               "#{node["vlg-clicksense"]["local_dir"]}/cache/clustercache",
               "#{node["vlg-clicksense"]["local_dir"]}/cache/cm",
               "#{node["vlg-clicksense"]["local_dir"]}/data",
               "#{node["vlg-clicksense"]["local_dir"]}/data/adnetwork",
               "#{node["vlg-clicksense"]["local_dir"]}/logs"
              ]

directories.each do |dir_name|
  directory dir_name do
    owner "#{node['vlg-base']['app_user']}"
    group "#{node['vlg-base']['app_user']}"
    mode "0755"
  end
end
