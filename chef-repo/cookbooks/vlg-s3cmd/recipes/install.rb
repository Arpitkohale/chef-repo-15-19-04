#
# Cookbook Name:: vlg-s3cmd
# Recipe:: install
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/s3cmd-#{node['vlg-s3cmd']['version']}.tar.gz" do
  source "http://s3.amazonaws.com/videologypublic/repo/s3cmd-#{node['vlg-s3cmd']['version']}.tar.gz"
  checksum node['vlg-s3cmd']['checksum']
  not_if "/usr/bin/s3cmd --version | grep #{node['vlg-s3cmd']['version']}"
  notifies :run, "bash[install_s3cmd]", :immediately
end

bash "install_s3cmd" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf /tmp/s3cmd-#{node['vlg-s3cmd']['version']}.tar.gz
    (cd s3cmd-#{node['vlg-s3cmd']['version']}; python setup.py install; rm -rf /tmp/s3cmd-#{node['vlg-s3cmd']['version']}.tar.gz; rm -rf /tmp/s3cmd-#{node['vlg-s3cmd']['version']})
  EOH
  action :nothing
end

link "/usr/bin/s3cmd" do
  to "/usr/local/bin/s3cmd"
  only_if "test -f /usr/local/bin/s3cmd"
end
