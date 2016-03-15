#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# syslog email alert
template '/etc/rsyslog.d/55-email.conf' do
  source 'rsyslog-email.conf.erb'
  mode '0644'
  action :create
  notifies :restart, "service[rsyslog]", :delayed
end
