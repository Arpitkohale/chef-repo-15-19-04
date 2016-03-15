# Cookbook Name:: vlg-lz-jb
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

case node.chef_environment
  when "production"
    include_recipe "vlg-lz-jb::dirs"
    include_recipe "vlg-lz-jb::mycnf"
    include_recipe "vlg-java::default"
    include_recipe "vlg-s3cmd::default"
    include_recipe "vlg-diamond::default"
    include_recipe "python::default"
    include_recipe "vlg-lz-jb::ansiblemodules"
  when "staging"
    include_recipe "vlg-lz-jb::dirs"
    include_recipe "vlg-java::default"
    include_recipe "vlg-s3cmd::default"
    include_recipe "vlg-diamond::default"
    include_recipe "python::default"
    include_recipe "vlg-lz-jb::ansiblemodules"
  when "sandbox"
    include_recipe "vlg-lz-jb::dirs"
    include_recipe "vlg-java::default"
    include_recipe "vlg-s3cmd::default"
    include_recipe "vlg-diamond::default"
    include_recipe "python::default"
    include_recipe "vlg-lz-jb::ansiblemodules"
  else #vagrant
    include_recipe "vlg-lz-jb::dirs"
    include_recipe "vlg-java::default"
end