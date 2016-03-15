#
# Cookbook Name:: vlg-lz-cb-r32x
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file File.join(Chef::Config[:file_cache_path], node['vlg-couchbase']['package_file']) do
  source node['vlg-couchbase']['package_full_url']
  action :create_if_missing
end

rpm_package File.join(Chef::Config[:file_cache_path], node['vlg-couchbase']['package_file'])

execute 'move-couchbase-data-dir' do
  command <<-EOF
    /etc/init.d/couchbase-server stop
    while [ "$(/etc/init.d/couchbase-server status 1> /dev/null ; echo $?)" -eq 0 ]; do echo "Stopping couchbase for reconfiguration..."; sleep 2; done
    killall epmd;
    killall beam.smp;
    mv -f /opt/couchbase/var/lib/couchbase/ #{node['vlg-couchbase']['data_dir']} && ln -s #{node['vlg-couchbase']['data_dir']}/couchbase /opt/couchbase/var/lib/couchbase
    /etc/init.d/couchbase-server start
  EOF
  not_if { File.symlink?('/opt/couchbase/var/lib/couchbase') }
end
