#
# Cookbook Name:: vlg-nagios
# Recipe:: dirs
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

nagios_spool_dir = node['vlg-nagios']['spool_dir']

directories = [ "#{nagios_spool_dir}/rw",
		"#{nagios_spool_dir}/tmp",
		"#{nagios_spool_dir}/checkresults"
]
directories.each do |directory_name|
  directory directory_name do
    owner "nagios"
    group "nagios"
    mode '0664'
    action :create
    only_if "test -d #{nagios_spool_dir}"
  end
end
