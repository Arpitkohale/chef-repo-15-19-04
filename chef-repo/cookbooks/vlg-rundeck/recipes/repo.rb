#
# Cookbook Name:: vlg-rundeck
# Recipe:: repo
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['vlg-rundeck']['digitalEnvoy_scripts_dir']}" do
  owner 'root'
  group 'root'
  mode "0755"
end

directory "#{node['vlg-rundeck']['etl_scripts_dir']}" do
  owner 'root'
  group 'root'
  mode "0755"
end

git "#{node['vlg-rundeck']['etl_scripts_dir']}" do
  repository "#{node['vlg-base']['git_url']}/scm/data/etlscripts.git"
  action :sync
  timeout 30
  ignore_failure true
  notifies :run, "bash[fix_etl_scripts_repo]", :immediately
end

bash "fix_etl_scripts_repo" do
  user "root"
  code <<-EOH
  if [ -d "#{node['vlg-rundeck']['etl_scripts_dir']}" ]
  then
    for i in $(find #{node['vlg-rundeck']['etl_scripts_dir']}/ -type f -name "*.sh")
    do
      if [ -f "$i" ]
      then
        chmod +x $i
        dos2unix $i
      fi
    done
    for i in $(find #{node['vlg-rundeck']['etl_scripts_dir']}/ -type f -name "*.groovy")
    do
      if [ -f "$i" ]
      then
        dos2unix $i
      fi
    done
  fi
  EOH
  action :nothing
end

link "/scripts" do
  to node['vlg-rundeck']['etl_scripts_dir']
end

git "#{node['vlg-rundeck']['digitalEnvoy_scripts_dir']}" do
  repository "#{node['vlg-base']['git_url']}/scm/gio/digitalEnvoy.git"
  action :sync
  timeout 30
  ignore_failure true
end


