#
# Cookbook Name:: vlg-base
# Recipe:: hosts
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

if node['vlg-base']['manage_etc_hosts'] == 'true'

  hostsfile_entry "127.0.0.1" do
    hostname 'localhost.localdomain'
    aliases  [ 'localhost' ]
    action :create
    priority 1000
  end

  if node['vlg-base']['127.0.1.1'] == 'true' then
    hostsfile_entry node['vlg-base']['hostname_hosts_entry'] do
      hostname node['hostname'] + '.inf.videologygroup.com'
      aliases [ node['hostname'] ]
      unique  node['vlg-base']['hostname_hosts_entry_unique']
      action :create
      priority 1000
    end
  end

end
