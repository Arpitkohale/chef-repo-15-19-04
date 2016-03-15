#
# Cookbook Name:: vlg-base
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe_now "aws::default"
include_recipe_now "aws::ec2_hints"
include_recipe_now "vlg-ephemeral::default"
include_recipe "vlg-base::cleanup"
include_recipe "vlg-base::hostname"
include_recipe "vlg-base::hosts"
include_recipe "selinux::disabled"
include_recipe "iptables::disabled"
include_recipe "vlg-base::python"
include_recipe "python::default"
include_recipe "yum::default"
include_recipe "yum-epel::default"
include_recipe "build-essential::default"
include_recipe "packages::default"
include_recipe "vlg-base::motd"
include_recipe "vlg-base::app_user"
include_recipe "vlg-base::dirs"
include_recipe "sshd::default"
include_recipe "sudo::default"
include_recipe "vlg-base::sudoers"
include_recipe "sysctl::default"
include_recipe "vlg-base::limits"
include_recipe "vlg-base::timezone"
include_recipe "ntp::default"
include_recipe "vlg-base::location"
include_recipe "vlg-dotfiles::default"
include_recipe "vlg-swap::default"
include_recipe "vlg-cron::default"
include_recipe "vlg-base::forward"
include_recipe "vlg-base::resolver"
include_recipe "vlg-base::ssh_config"
include_recipe "vlg-base::ohai"
include_recipe "vlg-base::exim"
include_recipe "vlg-base::cron"

if node.chef_environment == "production"
  include_recipe "nrpe::default"
  include_recipe "vlg-base::nrpe_checks"
  include_recipe "vlg-base::syslog"
end

if node.chef_environment == "staging"
  include_recipe "nrpe::default"
  include_recipe "vlg-base::nrpe_checks"
end

unless Chef::Config[:solo]
  include_recipe "hipchat::handler"
  include_recipe "chef-client::default"
  include_recipe "chef-client::config"
  include_recipe "chef-client::delete_validation"
  include_recipe "rsyslog::client"
  include_recipe "vlg-base::bin"
  include_recipe "vlg-base::aws"
  include_recipe "vlg-base::users"
  include_recipe "vlg-base::dynect"
  include_recipe "vlg-base::knife"
  include_recipe "vlg-diamond::default"
end
