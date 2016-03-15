#
# Cookbook Name:: vlg-base
# Recipe:: nrpe_checks
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

nrpe_check "check_datadog" do
  command "#{node['nrpe']['plugin_dir']}/check_procs"
  warning_condition '1:1'
  critical_condition '1:1'
  parameters "-a ddagent.py -u dd-agent"
  action :add
end

nrpe_check "check_diamond" do
  command "#{node['nrpe']['plugin_dir']}/check_procs"
  warning_condition '1:1'
  critical_condition '1:1'
  parameters "-a diamond -u root"
  action :add
end

nrpe_check "check_disk_local" do
  command "#{node['nrpe']['plugin_dir']}/check_disk"
  warning_condition "#{node['vlg-base']['nrpe']['check_disk']['warning']}"
  critical_condition "#{node['vlg-base']['nrpe']['check_disk']['critical']}"
  parameters "-l -m"
  action :add
end

nrpe_check "check_log_size" do
  command "#{node['vlg-base']['bin_dir']}/check-log-size.sh $ARG1$ $ARG2$"
  action :add
end

nrpe_check "check_file_count" do
  command "#{node['vlg-base']['bin_dir']}/check-file-count.sh $ARG1$ $ARG2$ $ARG3$"
  action :add
end

nrpe_check "check_file" do
  command "#{node['vlg-base']['bin_dir']}/check-file.sh $ARG1$"
  action :add
end
