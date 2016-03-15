#
# Cookbook Name:: vlg-ssl
# Recipe:: godaddy_bundle
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# godaddy_bundle.crt
data = Chef::EncryptedDataBagItem.load("ssl", "godaddy_bundle")
godaddy_bundle_crt = data["crt"]

template "/etc/pki/CA/certs/godaddy_bundle.crt" do
  source "godaddy_bundle.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :godaddy_bundle_crt => godaddy_bundle_crt
  })
end

# godaddy_bundle_sha2.crt
data = Chef::EncryptedDataBagItem.load("ssl", "godaddy_bundle_sha2")
godaddy_bundle_sha2_crt = data["crt"]

template "/etc/pki/CA/certs/godaddy_bundle_sha2.crt" do
  source "godaddy_bundle_sha2.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :godaddy_bundle_sha2_crt => godaddy_bundle_sha2_crt
  })
end

# gdig2_bundle.crt
data = Chef::EncryptedDataBagItem.load("ssl", "gdig2_bundle")
gdig2_bundle_crt = data["crt"]

template "/etc/pki/CA/certs/gdig2_bundle.crt" do
  source "gdig2_bundle.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :gdig2_bundle_crt => gdig2_bundle_crt
  })
end
