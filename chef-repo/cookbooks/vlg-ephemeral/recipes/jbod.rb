#
# Cookbook Name:: vlg-ephemeral
# Recipe:: jbod
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Include the lvm::default recipe which sets up the resources/providers for lvm
#
include_recipe "lvm"

jbod_root = node['vlg-ephemeral']['jbod']['root']

if !node.attribute?('cloud') || !node['cloud'].attribute?('provider') || !node.attribute?(node['cloud']['provider'])
  log "Not running on a known cloud, not setting up ephemeral LVM"
else
  # Obtain the current cloud
  cloud = node['cloud']['provider']

  # Obtain the available ephemeral devices. See "libraries/helper.rb" for the definition of
  # "get_ephemeral_devices" method.
  #
  ephemeral_devices = EphemeralLvm::Helper.get_ephemeral_devices(cloud, node)

  if ephemeral_devices.empty?
    log "No ephemeral disks found. Skipping setup."
  else
    log "Ephemeral disks found for cloud '#{cloud}': #{ephemeral_devices.inspect}"

  ephemeral_count = 0
  ephemeral_devices.each do |ephemeral_device|
        execute "mkfs.ext4 #{ephemeral_device}" do
          command "mkfs.ext4 -m 0 -T largefile -O dir_index,extent,sparse_super #{ephemeral_device}"
          not_if  "grep -w #{ephemeral_device} /proc/mounts /etc/fstab"
        end

        directory "#{jbod_root}/ephemeral#{ephemeral_count}" do
          owner "root"
          group "root"
          mode "0755"
          recursive true
        end

        mount "#{jbod_root}/ephemeral#{ephemeral_count}" do
          device "#{ephemeral_device}"
          fstype "ext4"
          action [:mount, :enable]
	  options "defaults, noatime, nodiratime"
        end

    ephemeral_count += 1
  end

  end
end
