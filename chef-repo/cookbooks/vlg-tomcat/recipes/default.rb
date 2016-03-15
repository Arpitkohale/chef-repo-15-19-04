#
# Cookbook Name:: vlg-tomcat
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-java::default"
include_recipe "vlg-tomcat::setup"
include_recipe "vlg-tomcat::dirs"
include_recipe "vlg-tomcat::logrotate"
include_recipe "vlg-tomcat::conf"
include_recipe "vlg-tomcat::init"
include_recipe "vlg-ssl::godaddy_bundle"
unless Chef::Config[:solo]
    include_recipe "vlg-tomcat::syslog"
end
