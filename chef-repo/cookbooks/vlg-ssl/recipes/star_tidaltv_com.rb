#
# Cookbook Name:: vlg-ssl
# Recipe:: star_tidaltv_com
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-ssl::godaddy_bundle"

data = Chef::EncryptedDataBagItem.load("ssl", "star_tidaltv_com")
star_tidaltv_com_crt = data["crt"]
star_tidaltv_com_key = data["key"]

data = Chef::EncryptedDataBagItem.load("ssl", "gdig2_bundle")
gdig2_bundle = data["crt"]

template "/etc/pki/tls/certs/star.tidaltv.com.crt" do
  source "star.tidaltv.com.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_tidaltv_com_crt => star_tidaltv_com_crt
  })
end

template "/etc/pki/tls/private/star.tidaltv.com.key" do
  source "star.tidaltv.com.key.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_tidaltv_com_key =>  star_tidaltv_com_key
  })
end

template "/etc/pki/tls/private/star.tidaltv.com.pem" do
  source "star.tidaltv.com.pem.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_tidaltv_com_crt =>  star_tidaltv_com_crt,
    :star_tidaltv_com_key =>  star_tidaltv_com_key,
    :gdig2_bundle =>  gdig2_bundle
  })
end
