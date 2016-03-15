#
# Cookbook Name:: vlg-tomcat
# Recipe:: syslog
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# send catalina.out to syslog
rsyslog_file_input "tomcat-catalina-out" do
  name "tomcat-catalina-out"
  file "#{node['vlg-tomcat']['logs_dir']}/catalina.out"
end
