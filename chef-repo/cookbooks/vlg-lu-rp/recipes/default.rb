#
# Cookbook Name:: vlg-lu-rp
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#

include_recipe "vlg-lu-rp::dirs"
# include_recipe "vlg-lu-rp::CreateDisk"
# include_recipe "vlg-lu-rp::MountDisk"
# include_recipe "vlg-lu-rp::crons"


unless Chef::Config[:solo]
  include_recipe "vlg-lu-rp::CreateDisk"
  include_recipe "vlg-lu-rp::MountDisk"
  include_recipe "vlg-diamond::default"
  include_recipe "vlg-s3cmd::default"
end

include_recipe "infobright::install"



