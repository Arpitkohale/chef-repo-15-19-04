#
# Cookbook Name:: vlg-nagios
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-nagios::repo"
include_recipe "vlg-nagios::pagerduty"
include_recipe "vlg-nagios::dirs"
include_recipe "vlg-nagios::services"
