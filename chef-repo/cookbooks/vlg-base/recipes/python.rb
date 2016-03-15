#
# Cookbook Name:: vlg-base
# Recipe:: python
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

package "python-setuptools" do
  action :remove
end

remote_file "/tmp/get-pip.py" do
  source node['vlg-base']['python']['get_pip_url']
  not_if "test -f /usr/bin/pip"
  notifies :run, "bash[install_pip]", :immediately
end

bash "install_pip" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    python get-pip.py; rm -rf get-pip.py
  EOH
  action :nothing
end
