#
# Cookbook Name:: vlg-data-ftp
# Recipe:: nrpe_checks
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

nrpe_check "check_ftp_root" do
  command "#{node['vlg-base']['bin_dir']}/data/check-ftp-root.sh"
  action :add
end

sudo 'nagios' do
  user      'nagios'
  nopasswd  true
  commands  node['vlg-data-ftp']['sudoers']['nagios']
end
