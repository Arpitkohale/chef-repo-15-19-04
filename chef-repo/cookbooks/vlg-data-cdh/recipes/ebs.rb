#
# Cookbook Name:: vlg-data-cdh
# Recipe:: ebs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['vlg-data-cdh']['ebs'] == 'true'

  data = Chef::EncryptedDataBagItem.load("aws", "videology")
  aws_access_key_id = data["aws_access_key_id"]
  aws_secret_access_key = data["aws_secret_access_key"]

  # create the volumes
  aws_ebs_volume "data_ebs01" do
    aws_access_key aws_access_key_id
    aws_secret_access_key aws_secret_access_key
    size 128
    volume_type "gp2"
    device "/dev/sdj"
    action [ :create, :attach ]
  end
  aws_ebs_volume "data_ebs02" do
    aws_access_key aws_access_key_id
    aws_secret_access_key aws_secret_access_key
    size 128
    volume_type "gp2"
    device "/dev/sdk"
    action [ :create, :attach ]
  end
  aws_ebs_volume "data_ebs03" do
    aws_access_key aws_access_key_id
    aws_secret_access_key aws_secret_access_key
    size 128
    volume_type "gp2"
    device "/dev/sdl"
    action [ :create, :attach ]
  end
  aws_ebs_volume "data_ebs04" do
    aws_access_key aws_access_key_id
    aws_secret_access_key aws_secret_access_key
    size 128
    volume_type "gp2"
    device "/dev/sdm"
    action [ :create, :attach ]
  end

  # tag the volumes
  aws_resource_tag "data_ebs01" do
    resource_id lazy { node['aws']['ebs_volume']['data_ebs01']['volume_id'] }
    tags ({"Service" => "CDH"})
  end
  aws_resource_tag "data_ebs02" do
    resource_id lazy { node['aws']['ebs_volume']['data_ebs02']['volume_id'] }
    tags ({"Service" => "CDH"})
  end
  aws_resource_tag "data_ebs03" do
    resource_id lazy { node['aws']['ebs_volume']['data_ebs03']['volume_id'] }
    tags ({"Service" => "CDH"})
  end
  aws_resource_tag "data_ebs04" do
    resource_id lazy { node['aws']['ebs_volume']['data_ebs04']['volume_id'] }
    tags ({"Service" => "CDH"})
  end

  # create the file systems
  execute "mkfs.ext4 /dev/xvdj" do
    command "mkfs.ext4 /dev/xvdj"
    not_if  "grep -w /dev/xvdj /proc/mounts /etc/fstab"
  end
  execute "mkfs.ext4 /dev/xvdk" do
    command "mkfs.ext4 /dev/xvdk"
    not_if  "grep -w /dev/xvdk /proc/mounts /etc/fstab"
  end
  execute "mkfs.ext4 /dev/xvdl" do
    command "mkfs.ext4 /dev/xvdl"
    not_if  "grep -w /dev/xvdl /proc/mounts /etc/fstab"
  end
  execute "mkfs.ext4 /dev/xvdm" do
    command "mkfs.ext4 /dev/xvdm"
    not_if  "grep -w /dev/xvdm /proc/mounts /etc/fstab"
  end

  # create the directories
  directory '/data/ebs01' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  directory '/data/ebs02' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  directory '/data/ebs03' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
  directory '/data/ebs04' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  # mount the volumes
  mount '/data/ebs01' do
    device "/dev/xvdj"
    fstype "ext4"
    action [:mount, :enable]
  end
  mount '/data/ebs02' do
    device "/dev/xvdk"
    fstype "ext4"
    action [:mount, :enable]
  end
  mount '/data/ebs03' do
    device "/dev/xvdl"
    fstype "ext4"
    action [:mount, :enable]
  end
  mount '/data/ebs04' do
    device "/dev/xvdm"
    fstype "ext4"
    action [:mount, :enable]
  end

end
