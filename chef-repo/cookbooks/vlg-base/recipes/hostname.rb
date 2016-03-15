#
# Cookbook Name:: vlg-base
# Recipe:: hostname
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

# The hostname might be incorrect when we start. This pulls the correct hostname from the node name that we provide during bootstrap.
hostname = node.name.end_with?(".inf.videologygroup.com") ? node.name : "#{node.name}.inf.videologygroup.com"

execute "set_hostname" do
  command "/bin/hostname #{hostname}"
  only_if "[ `/bin/hostname` != '#{hostname}' ]"
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/sysconfig/network")
    file.search_file_replace_line(".*HOSTNAME.*", "HOSTNAME=#{hostname}")
    file.write_file
    file.insert_line_if_no_match(".*HOSTNAME.*", "HOSTNAME=#{hostname}")
    file.write_file
  end
  only_if { open('/etc/sysconfig/network') { |f| f.grep(/#{hostname}/).empty? } }
end
