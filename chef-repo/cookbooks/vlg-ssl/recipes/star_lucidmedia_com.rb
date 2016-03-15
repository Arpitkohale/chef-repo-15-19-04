#
# Cookbook Name:: vlg-ssl
# Recipe:: star_lucidmedia_com
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "vlg-ssl::godaddy_bundle"

data = Chef::EncryptedDataBagItem.load("ssl", "star_lucidmedia_com")
star_lucidmedia_com_crt = data["crt"]
star_lucidmedia_com_key = data["key"]

data = Chef::EncryptedDataBagItem.load("ssl", "godaddy_bundle")
godaddy_bundle = data["crt"]

template "/etc/pki/tls/certs/star.lucidmedia.com.crt" do
  source "star.lucidmedia.com.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_lucidmedia_com_crt => star_lucidmedia_com_crt
  })
end

template "/etc/pki/tls/private/star.lucidmedia.com.key" do
  source "star.lucidmedia.com.key.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_lucidmedia_com_key =>  star_lucidmedia_com_key
  })
end

template "/etc/pki/tls/private/star.lucidmedia.com.pem" do
  source "star.lucidmedia.com.pem.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_lucidmedia_com_crt =>  star_lucidmedia_com_crt,
    :star_lucidmedia_com_key =>  star_lucidmedia_com_key,
    :godaddy_bundle =>  godaddy_bundle
  })
end
