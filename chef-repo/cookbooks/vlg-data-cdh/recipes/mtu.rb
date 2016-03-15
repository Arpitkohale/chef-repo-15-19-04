#
# Cookbook Name:: vlg-data-cdh
# Recipe:: mtu
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

bash 'set_eth0_mtu' do
  code <<-EOH
    MTU=$(ifconfig eth0 | grep MTU: | cut -d':' -f2 | awk '{print $1}')
    if [ "$MTU" != "1400" ]
    then
      ifconfig eth0 mtu 1400 up
    fi
    EOH
  not_if "ifconfig eth0 | grep -q MTU:1400"
end
