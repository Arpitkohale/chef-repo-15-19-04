#
# Cookbook Name:: vlg-ssl
# Recipe:: star_cmrdr_com
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Decrypt the data bag
data = Chef::EncryptedDataBagItem.load("ssl", "star_cmrdr_com")
star_cmrdr_com_crt = data["crt"]
star_cmrdr_com_key = data["key"]

data = Chef::EncryptedDataBagItem.load("ssl", "godaddy_bundle")
godaddy_bundle = data["crt"]

template "/etc/pki/tls/certs/star.cmrdr.com.crt" do
  source "star.cmrdr.com.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_cmrdr_com_crt => star_cmrdr_com_crt
  })
end

template "/etc/pki/tls/private/star.cmrdr.com.key" do
  source "star.cmrdr.com.key.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_cmrdr_com_key =>  star_cmrdr_com_key
  })
end

template "/etc/pki/tls/private/star.cmrdr.com.pem" do
  source "star.cmrdr.com.pem.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
                :star_cmrdr_com_crt =>  star_cmrdr_com_crt,
                :star_cmrdr_com_key =>  star_cmrdr_com_key,
                :godaddy_bundle =>  godaddy_bundle
            })
end
