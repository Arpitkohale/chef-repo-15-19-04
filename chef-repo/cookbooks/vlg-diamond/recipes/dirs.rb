#
# Cookbook Name:: vlg-diamond
# Recipe:: dirs
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

directories = [ "/etc/diamond/empty",
		"/var/log/diamond"
]
directories.each do |directory_name|
  directory directory_name do
    owner "root"
    group "root"
    mode '0775'
    action :create
    only_if "test -d /etc/diamond"
  end
end
