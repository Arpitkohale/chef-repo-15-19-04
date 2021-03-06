#
# Cookbook Name:: vlg-ssl
# Recipe:: star_videologygroup_com
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Decrypt the data bag
data = Chef::EncryptedDataBagItem.load("ssl", "star_videologygroup_com")
star_videologygroup_com_crt = data["crt"]
star_videologygroup_com_key = data["key"]

data = Chef::EncryptedDataBagItem.load("ssl", "gdig2_bundle")
gdig2_bundle = data["crt"]


template "/etc/pki/tls/certs/star.videologygroup.com.crt" do
  source "star.videologygroup.com.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_videologygroup_com_crt => star_videologygroup_com_crt
  })
end

template "/etc/pki/tls/private/star.videologygroup.com.key" do
  source "star.videologygroup.com.key.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_videologygroup_com_key =>  star_videologygroup_com_key
  })
end

template "/etc/pki/tls/private/star.videologygroup.com.pem" do
  source "star.videologygroup.com.pem.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
                :star_videologygroup_com_crt =>  star_videologygroup_com_crt,
                :star_videologygroup_com_key =>  star_videologygroup_com_key,
                :gdig2_bundle =>  gdig2_bundle
            })
end
