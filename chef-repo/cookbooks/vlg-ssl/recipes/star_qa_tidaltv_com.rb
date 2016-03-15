#
# Cookbook Name:: vlg-ssl
# Recipe:: star_qa_tidaltv_com
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Decrypt the data bag
data = Chef::EncryptedDataBagItem.load("ssl", "star_qa_tidaltv_com")
star_qa_tidaltv_com_crt = data["crt"]
star_qa_tidaltv_com_key = data["key"]

template "/etc/pki/tls/certs/star.qa.tidaltv.com.crt" do
  source "star.qa.tidaltv.com.crt.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_qa_tidaltv_com_crt => star_qa_tidaltv_com_crt
  })
end

template "/etc/pki/tls/private/star.qa.tidaltv.com.key" do
  source "star.qa.tidaltv.com.key.erb"
  user "root"
  group "#{node['vlg-base']['app_user']}"
  mode "0640"
  action :create
  variables({
    :star_qa_tidaltv_com_key =>  star_qa_tidaltv_com_key
  })
end
