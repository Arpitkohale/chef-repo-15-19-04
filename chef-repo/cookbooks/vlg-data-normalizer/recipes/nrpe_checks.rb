#
# Cookbook Name:: vlg-data-normalizer
# Recipe:: nrpe_checks
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

nrpe_check "check_normalizer_working_dir" do
  command "#{node['vlg-base']['bin_dir']}/check-normalizer-working-dir.sh"
  action :add
end
