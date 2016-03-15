#
# Cookbook Name:: vlg-lu-db
# Recipe:: default
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# NOTE: This is a really simple cookbook... If we ever require a sophisticated mysql setup, someone should create a vlg-mysql wrapper cookbook and a fancy my.cnf template.
# I didn't put too much effort into this because there is minimal mysql infrastructure.
# -jp
include_recipe "vlg-lu-db::setup"
include_recipe "vlg-lu-db::conf"
include_recipe "vlg-lu-db::dirs"
unless Chef::Config[:solo]
  include_recipe "vlg-diamond::default"
  include_recipe "vlg-s3cmd::default"
end
