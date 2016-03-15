#
# Cookbook Name:: vlg-base
# Recipe:: exim
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

service 'sendmail' do
  action :nothing
end

package "sendmail" do
  action :remove
  only_if "rpm -q sendmail"
end

service 'postfix' do
  action :nothing
end

package "postfix" do
  action :remove
  only_if "rpm -q postfix"
end

user "postfix" do
  action :remove
  only_if "getent passwd postfix"
end

group "postfix" do
  action :remove
  only_if "getent group postfix"
end

package "ssmtp" do
  action :remove
  only_if "rpm -q ssmtp"
end

package "exim" do
  action :install
end

unless Chef::Config[:solo]
  data = Chef::EncryptedDataBagItem.load("exim", "smtp_sasl_credentials")
  smtp_sasl_user_name = data["smtp_sasl_user_name"]
  smtp_sasl_passwd = data["smtp_sasl_passwd"]
  smtp_host = node['vlg-base']['exim']['smtp']['host']
  template "/etc/exim/exim.conf" do
    source "exim.conf.erb"
    owner 'root'
    group 0
    mode '0644'
    variables({
      :smtp_sasl_user_name => smtp_sasl_user_name,
      :smtp_sasl_passwd => smtp_sasl_passwd,
      :smtp_host => smtp_host
    })
    notifies :restart, 'service[exim]', :delayed
  end
end

execute "newaliases" do
  action :nothing
  command "newaliases"
end

template "/etc/aliases" do
  source "aliases.erb"
  owner 'root'
  group 0
  mode '0644'
  notifies :run, "execute[newaliases]", :delayed
end

service 'exim' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
