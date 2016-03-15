#
# Cookbook Name:: vlg-base
# Recipe:: users
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
users_manage "root" do
  group_id 0
  action [ :remove, :create ]
end

users_manage "users" do
  group_id 100
  action [ :remove, :create ]
end

users_manage "lucy" do
  group_id 55000
  action [ :remove, :create ]
end

users_manage "eliza" do
  group_id 55001
  action [ :remove, :create ]
end

users_manage "optdev" do
  group_id 55002
  action [ :remove, :create ]
end

users_manage "gio" do
  group_id 55003
  action [ :remove, :create ]
end

users_manage "data" do
  group_id 55004
  action [ :remove, :create ]
end

users_manage "mis" do
  group_id 55005
  action [ :remove, :create ]
end

users_manage "rnd" do
  group_id 55006
  action [ :remove, :create ]
end

users_manage "maya" do
  group_id 55007
  action [ :remove, :create ]
end

users_manage "techops" do
  group_id 55008
  action [ :remove, :create ]
end

users_manage "appdev" do
  group_id 55009
  action [ :remove, :create ]
end

users_manage "wheel" do
  group_id 10
  action [ :remove, :create ]
end
