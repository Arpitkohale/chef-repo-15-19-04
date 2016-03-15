#
# Cookbook Name:: vlg-clicksense
# Recipe:: syslog
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# send clicksense logs to syslog
rsyslog_file_input "cs-application-log" do
  name "cs-application-log"
  file "#{node['vlg-clicksense']['local_dir']}/logs/application.log"
end
