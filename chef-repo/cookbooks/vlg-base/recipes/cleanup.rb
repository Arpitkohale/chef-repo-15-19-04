#
# Cookbook Name:: vlg-base
# Recipe:: cleanup
#
# Copyright 2014, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#


bash "userdel -r ec2-user -f" do
  code <<-EOH
  if [ `grep -c ec2-user /etc/passwd` -gt 0 ]
  then
    userdel -r ec2-user -f
  fi
  EOH
  ignore_failure true
end

user "rightscale" do
  action :remove
  ignore_failure true
end

group "rightscale_sudo" do
  action :remove
  ignore_failure true
end

packages = [ "rightlink6", "rightimage-extras-base", "rightlink6-sandbox", "rightlink6-cloud-ec2" ]
packages.each do |package_name|
  package package_name do
    action :remove
  end
end

directories = [ "/etc/rightscale.d/", "/home/rightscale/", "/var/cache/yum/x86_64/6/rightscale-epel/", "/var/lib/yum/repos/x86_64/6/rightlink/", "/var/lib/yum/repos/x86_64/6/rightscale-epel", "/etc/update-motd.d" ]
directories.each do |directory_name|
  directory directory_name do
    recursive true
    action :delete
  end
end

files = [ "/etc/sudoers.d/rightscale_users", "/etc/sudoers.d/rightscale", "/etc/yum.repos.d/rightlink.repo", "/var/spool/mail/rightscale", "/etc/cron.d/update-motd" ]
files.each do |file_name|
  file file_name do
    action :delete
  end
end
