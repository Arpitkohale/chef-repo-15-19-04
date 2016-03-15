#
# Cookbook Name:: vlg-anaconda
# Recipe:: links
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

link "/usr/local/bin/conda" do
  to "#{node['anaconda']['install_root']}/#{node['anaconda']['version']}/bin/conda"
end

link "/usr/local/bin/activate" do
  to "#{node['anaconda']['install_root']}/#{node['anaconda']['version']}/bin/activate"
end

link "/usr/local/bin/deactivate" do
  to "#{node['anaconda']['install_root']}/#{node['anaconda']['version']}/bin/deactivate"
end
