# Cookbook Name:: vlg-lz-sm-nb
# Recipe:: nrpe_checks
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

template '/etc/nagios/nrpe.d/check_storm.cfg' do
  source 'check_storm.cfg.erb'
  mode 0644
end
