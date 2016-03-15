#
# Cookbook Name:: vlg-diamond
# Recipe:: setup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

python_pip "Diamond" do
  version "3.5.33"
end

link "/usr/bin/diamond" do
  to "/usr/local/bin/diamond"
  only_if "test -f /usr/local/bin/diamond"
end

link "/usr/share/diamond" do
  to "/usr/local/share/diamond"
  only_if "test -d /usr/local/share/diamond"
end

template '/etc/init.d/diamond' do
  source 'init.erb'
  mode '0755'
  action :create
  not_if "test -f /etc/init.d/diamond"
end

service 'diamond' do
  action [:enable]
end
