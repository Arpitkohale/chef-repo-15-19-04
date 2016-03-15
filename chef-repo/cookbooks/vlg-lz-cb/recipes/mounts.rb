#
# Cookbook Name:: vlg-dmp-kz
# Recipe:: mounts
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

execute "mkfs.ext4 /dev/xvdj" do
          command "mkfs.ext4 /dev/xvdj"
          not_if  "grep -w /dev/xvdj /proc/mounts /etc/fstab"
        end

        mount "/data" do
          device "/dev/xvdj"
          fstype "ext4"
          action [:mount, :enable]
        end
