#
# Cookbook Name:: vlg-parallel
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/parallel-20150622.tar.gz" do
  source node['vlg-parallel']['download_url']
  mode '0644'
  not_if { ::File.exists?("/usr/local/bin/parallel") }
  notifies :run, "bash[install_parallel]", :immediately
end


bash 'install_parallel' do
  code <<-EOH
    cd #{Chef::Config[:file_cache_path]}
    tar xzf #{Chef::Config[:file_cache_path]}/parallel-20150622.tar.gz
    cd parallel-20150622
    ./configure
    make
    make install
    rm -rf #{Chef::Config[:file_cache_path]}/parallel-20150622.tar.gz #{Chef::Config[:file_cache_path]}/parallel-20150622
    EOH
  not_if { ::File.exists?("/usr/local/bin/parallel") }
end
