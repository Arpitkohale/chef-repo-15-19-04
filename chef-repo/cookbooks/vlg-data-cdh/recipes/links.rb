#
# Cookbook Name:: vlg-data-cdh
# Recipe:: links
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

link "/data/mount1" do
  to "/media/ephemeral0"
end

link "/data/mount2" do
  to "/media/ephemeral1"
end

link "/data/mount3" do
  to "/media/ephemeral2"
end

link "/data/mount4" do
  to "/media/ephemeral3"
end
