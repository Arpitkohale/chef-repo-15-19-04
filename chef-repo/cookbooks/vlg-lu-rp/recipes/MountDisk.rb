#
# Cookbook Name:: vlg-lu-rp
# Recipe:: MountDisk
#
# Copyright 2015, Videology Group, Inc.
#

execute 'mkfs.ext4 /dev/xvdh' do
  command "mkfs.ext4 /dev/xvdh"
  not_if "grep -w /vol /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdh"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /vol /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdi' do
  command "mkfs.ext4 /dev/xvdi"
  not_if "grep -w /store3 /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdi"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /store3 /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdj' do
  command "mkfs.ext4 /dev/xvdj"
  not_if "grep -w /store1 /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdj"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /store1 /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdk' do
  command "mkfs.ext4 /dev/xvdk"
  not_if "grep -w /store2 /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdk"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /store2 /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdl' do
  command "mkfs.ext4 /dev/xvdl"
  not_if "grep -w /reportingdir /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdl"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /reportingdir /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdm' do
  command "mkfs.ext4 /dev/xvdm"
  not_if "grep -w /backup /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdm"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /backup /proc/mounts /etc/fstab"
end

execute 'mkfs.ext4 /dev/xvdn' do
  command "mkfs.ext4 /dev/xvdn"
  not_if "grep -w /store4 /proc/mounts /etc/fstab"
end

mount "#{data_tmp_mount_point}" do
  device "/dev/xvdn"
  fstype 'ext4'
  action [:enable, :mount]
  not_if "grep -w /store4 /proc/mounts /etc/fstab"
  
execute 'mkswap /dev/xvdg' do
  command "mkswap /dev/xvdg;swapon /dev/xvdg"
  not_if "grep -w /store4 /proc/mounts /etc/fstab"
end
end


