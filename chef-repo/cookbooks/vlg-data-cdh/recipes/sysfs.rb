#
# Cookbook Name:: vlg-data-cdh
# Recipe:: sysfs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

file "/sys/kernel/mm/redhat_transparent_hugepage/defrag" do
  content 'never'
  not_if "grep -qw '\[never\]' /sys/kernel/mm/redhat_transparent_hugepage/defrag"
end

file "/sys/kernel/mm/redhat_transparent_hugepage/enabled" do
  content 'never'
  not_if "grep -qw '\[never\]' /sys/kernel/mm/redhat_transparent_hugepage/enabled"
end
