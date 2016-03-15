#
# Cookbook Name:: chef-infobright
# Recipe:: install
#
# Copyright 2014, Takeshi Mikami
#
# All rights reserved - Do Not Redistribute
#
url = node['infobright']['url']
download_path = "#{Chef::Config[:file_cache_path]}/#{node['infobright']['binaryname']}"

if url != nil
  # download
  Chef::Log.debug "download from infobright.org"
  bash "download" do
    code <<-EOH
      curl -L #{url} -o #{download_path}
    EOH
    not_if "test -f #{download_path}"
  end

  # rpm install
  rpm_package "infobright" do
    action :install
    source download_path
  end

  # copy my-ib.cnf
  bash "copy my-ib.cnf" do
    code "cp /etc/my-ib-#{node['infobright']['role']}.cnf /etc/my-ib.cnf"
  end

  # modify mysqld-ib
  bash "modify mysqld-ib" do
    code "sed -i 's/user=mysql/user=vlg/g' /etc/init.d/mysqld-ib; chown -R vlg:vlg /usr/local/infobright/data"
  end
  
  # symlink and ownership for infobright/data folder
  ## bash "modify mysqld-ib data" do
  ##  code "mkdir -p /store2/ib; cd /usr/local/infobright; mv data	data-old;  chown -R vlg:vlg /store2/ib; ln -s /store2/ib data; cp -ax ## data-old/* data; chown -R vlg:vlg /store2/ib"
  ## end
  
  directory "/store2/ib" do
    owner "#{node['vlg-base']['app_user']}"
	group "#{node['vlg-base']['app_user']}"
	recursive true
	action :create
	notifies :run, 'execute[move_mysql_data]', :immediately
  end
  
  execute 'move_mysql_data' do
    command "cd /usr/local/infobright; mv data data-old; ln -s /store2/ib data; cp -ax data-old/* data; chown -R vlg:vlg /store2/ib"
	only_if "test -d /store2/ib"
  end
    
  # symlink and ownership for infobright/cache folder
  ## bash "modify mysqld-ib cache" do
  ##  code "mkdir -p /store2/ib-cache; chown -R vlg:vlg /store2/ib-cache; chmod -R 775 /store2/ib-cache; cd /usr/local/infobright; mv cache cache-old; ln -s /store2/ib-cache cache"
  ##  end	
  
  directory '/store2/ib-cache' do
    owner "#{node['vlg-base']['app_user']}"
	group "#{node['vlg-base']['app_user']}"
	mode "0775"
	recursive true
	action :create
	notifies :run, 'execute[modify_mysqld_ib_cache]', :immediately
  end
  
  execute 'modify_mysqld_ib_cache' do
    command "cd /usr/local/infobright; mv cache cache-old; ln -s /store2/ib-cache cache"
	only_if "test -d /store2/ib-cache"
  end
  
  # start service
  service 'mysqld-ib' do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
  end

else
  Chef::Log.error "Unsupported platform"

end
